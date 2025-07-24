`timescale 1ns / 1ns

module fifosyn_tb();

    parameter FIFO_DEPTH = 8;
    parameter DATA_WIDTH = 32;
    
    reg clk = 0;
    reg rst_n, cs, wr_en, rd_en; 
    reg [DATA_WIDTH - 1:0] datain;
    wire [DATA_WIDTH - 1:0] dataout;
    wire empty, full;
    
    integer i;
    
    fifosyn #(.FIFO_DEPTH(FIFO_DEPTH),
               .DATA_WIDTH(DATA_WIDTH))
           dut(.clk(clk),
               .rst_n(rst_n),
               .cs(cs),
               .wr_en(wr_en),
               .rd_en(rd_en),
               .datain(datain),
               .dataout(dataout),
               .empty(empty),
               .full(full));       

    always #5 clk = ~clk;
    
    task write_data(input [DATA_WIDTH-1:0] d_in);
        begin
         @(posedge clk);
         cs = 1; wr_en = 1;
         datain = d_in;
         $display($time, "write_data datain = %0d", datain);
         @(posedge clk);
         cs = 1; wr_en = 0;   
        end
    endtask
    
    task read_data();
        begin
         @(posedge clk);
         cs = 1; rd_en = 1;
         @(posedge clk);
         $display($time, "read_data dataout = %0d", dataout);
         cs = 1; rd_en = 0;   
        end
    endtask
    
    initial begin
        rst_n = 0; wr_en = 0; rd_en = 0;
        @(posedge clk);
        rst_n = 1;
        $display($time, "\n Test case 1");
        write_data(34);
        write_data(100);
        write_data(1);
        read_data();
        read_data();
        read_data();
        
        $display($time, "\n test case 2");
        for(i = 0; i <= FIFO_DEPTH; i = i + 1)
        begin
            write_data(2**i);
            read_data();
        end
        
        $display($time, "\n test case 3");
        for(i = 0; i <= FIFO_DEPTH; i = i + 1)
            write_data(2**i);
        for(i = 0; i < FIFO_DEPTH; i = i + 1)
            read_data();
            
        #40 $finish;
    end
    
endmodule
