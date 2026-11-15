module origen_203438(
    input rst,
    input [31:0] pcM,
    input [7:0] exceptioncollectM,
    input [31:0] cp0_status,
    input [31:0] cp0_cause,
    input [31:0] aluoutM,
    output reg [31:0] excepttype_i,
    output reg [31:0] bad_addr
);

always @(*) begin
    if (rst) begin
        excepttype_i = 32'h00000000;
    end
    else if ((cp0_cause[15:8] & cp0_status[1:0]) != 0 && cp0_status[1] == 0 && cp0_status[0] == 1) begin
        excepttype_i = 32'h00000001;
    end
    else if (pcM[1:0] != 0) begin
        excepttype_i = 32'h00000004;
        bad_addr = pcM;
    end
    else if (exceptioncollectM[5]) begin
        excepttype_i = 32'h00000004;
        bad_addr = aluoutM;
    end
    else if (exceptioncollectM[1]) begin
        excepttype_i = 32'h00000008;
    end
    else if (exceptioncollectM[2]) begin
        excepttype_i = 32'h00000009;
    end
    else if (exceptioncollectM[0]) begin
        excepttype_i = 32'h0000000E;
    end
    else if (exceptioncollectM[3]) begin
        excepttype_i = 32'h0000000A;
    end
    else if (exceptioncollectM[4]) begin
        excepttype_i = 32'h0000000C;
    end
    else if (exceptioncollectM[6]) begin
        excepttype_i = 32'h00000005;
        bad_addr = aluoutM;
    end
    else begin
        excepttype_i = 32'h00000000;
    end
end

endmodule