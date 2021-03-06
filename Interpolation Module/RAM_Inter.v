module RAM #(parameter ADDRESS_WIDTH = 13,
             parameter DATA_WIDTH = 64,
             parameter DEPTH = 2**ADDRESS_WIDTH)
            (input CLK,
             input WR_Enable,
             input [ADDRESS_WIDTH - 1 :0] address_RD1,
             input [ADDRESS_WIDTH - 1 :0] address_RD2,
             input [ADDRESS_WIDTH - 1 :0] address_WR,
             output [DATA_WIDTH - 1 :0] dataOut1,
             output [DATA_WIDTH - 1 :0] dataOut2,
             input [DATA_WIDTH - 1 :0] dataIn);

    reg [DATA_WIDTH - 1 :0] Memory[0: DEPTH];
    initial
    begin
      $readmemb("testcase.txt", Memory);
    end
    integer i = 0;
    always @(posedge CLK) begin
            if (WR_Enable) begin
                Memory[address_WR] = dataIn;
            end
    end
    assign dataOut1 = Memory[address_RD1];
    assign dataOut2 = Memory[address_RD2];

endmodule
