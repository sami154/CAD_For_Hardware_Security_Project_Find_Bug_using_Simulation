`timescale 1 ns/1 ps
module tb_aes_1b;
reg [127:0] state;
reg [127:0] key;
wire [127:0] out;
reg clk;
integer file_read, cnt, file_write, cnt1;
reg [127:0] key_gread;
reg [127:0] ptext_gread;
reg [127:0] out_gread;
aes_128 uut (
	.state(state),
	.key (key),
	.clk (clk),
	.out(out)
);

//Cheching the condition based on whether the golden netlist outputs and the buggy netlist outputs are matched or not.  
task scoreboard;
    input [127:0] output_golden;
    input [127:0] output_bug;
	input int count;
	output int count_return;
        begin
				if (output_golden == output_bug)
					$display("Bug not found.");
				else
					begin
						$display ("Bug found");
						count_return=count+1;
					end
		end
		
endtask

always
begin
	#10 clk = !clk;
end


// Here, the generator code is written. The input key pattern and plain texts are read from the generated file from question 1a. 
initial 
begin 
	cnt=0;
	clk=0;
	#50;
		//$readmemh("vcs_aes_output.txt", )
		file_read = $fopen("vcs_aes_output.txt","r");
		file_write = $fopen("aes_buggy_output.txt","w");
		while (!$feof(file_read)) begin
			$fscanf(file_read,"%h %h %h \n",key_gread, ptext_gread, out_gread );
			$display("key %h", key_gread);
			key=key_gread;
			state=ptext_gread;
			#600;
			scoreboard(out_gread,out,cnt,cnt1);
			cnt=cnt1;
			$fwrite(file_write,"%h	%h	%h\n",key_gread,ptext_gread,out);
        end
	$fclose(file_read);
	$fclose(file_write);
	$display (cnt1);
	$finish;
end
endmodule
