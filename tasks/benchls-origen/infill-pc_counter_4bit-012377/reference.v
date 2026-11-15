module origen_012377 (
    input wire Clk,
    input wire Rst,
    input wire PC_INC,
    input wire PCH_INC,
    input wire PCH_IN,
    input wire PC_IN,
    input wire PC_OUT,
    input wire [3:0] BUS_IN,
    output reg [3:0] BUS_OUT,
    output wire [7:0] C_MEM
);

    reg [3:0] PC_LEFT;
    reg [3:0] PC_RIGHT;

    assign C_MEM = {PC_LEFT, PC_RIGHT};

    always @(negedge Clk or posedge Rst) begin
        if (Rst) begin
            PC_LEFT <= 4'b0000;
            PC_RIGHT <= 4'b0000;
        end else begin
            if (PC_INC) begin
                if (PC_RIGHT == 4'b1111 && PC_LEFT != 4'b1111) begin
                    PC_LEFT <= PC_LEFT + 1;
                    PC_RIGHT <= 4'b0000;
                end else if (PC_RIGHT != 4'b1111) begin
                    PC_RIGHT <= PC_RIGHT + 1;
                end
            end

            if (PCH_INC && PC_LEFT != 4'b1111) begin
                PC_LEFT <= PC_LEFT + 1;
            end

            if (PCH_IN) begin
                PC_LEFT <= BUS_IN;
            end

            if (PC_IN) begin
                PC_RIGHT <= BUS_IN;
            end
        end
    end

    always @(*) begin
        if (PC_OUT) begin
            BUS_OUT = PC_RIGHT;
        end else begin
            BUS_OUT = 4'bzzzz;
        end
    end

endmodule