module origen_153648(
    input clk,
    input rst,
    input carryout,
    input [7:0] result,
    input [7:0] read1,
    input [7:0] read2,
    input [7:0] instruction,
    input [7:0] data,
    output reg [1:0] ctrl0,
    output reg ctrl1,
    output reg clear,
    output reg reg1,
    output reg reg2,
    output reg write,
    output reg [3:0] opcode,
    output reg [7:0] address,
    output reg [7:0] input1,
    output reg [7:0] input2,
    output reg [7:0] datareg,
    output reg [7:0] out,
    output reg jump,
    output reg [7:0] jumpaddress
);

    reg [1:0] cycle;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cycle <= 0;
            ctrl0 <= 0;
            ctrl1 <= 0;
            clear <= 0;
            reg1 <= 0;
            reg2 <= 0;
            write <= 0;
            opcode <= 0;
            address <= 0;
            input1 <= 0;
            input2 <= 0;
            datareg <= 0;
            out <= 0;
            jump <= 0;
            jumpaddress <= 0;
        end else begin
            case (cycle)
                0: begin
                    address <= (jump) ? jumpaddress : read1;
                    ctrl0 <= 1;
                    cycle <= 1;
                end
                1: begin
                    opcode <= instruction[7:4];
                    case (instruction[7:4])
                        4'b0000: begin // ADD
                            input1 <= read1;
                            input2 <= read2;
                            ctrl0 <= 2;
                            ctrl1 <= 0;
                            reg1 <= 1;
                            write <= 1;
                            datareg <= result;
                            cycle <= 0;
                        end
                        4'b0001: begin // SUB
                            input1 <= read1;
                            input2 <= read2;
                            ctrl0 <= 2;
                            ctrl1 <= 1;
                            reg1 <= 1;
                            write <= 1;
                            datareg <= result;
                            cycle <= 0;
                        end
                        // Other single instructions...
                        4'b1111: begin // NOP
                            cycle <= 0;
                        end
                        default: begin
                            cycle <= 2;
                        end
                    endcase
                end
                2: begin
                    case (instruction[7:4])
                        4'b1011: begin // LOAD
                            input1 <= data;
                            write <= 1;
                            reg1 <= 1;
                            datareg <= data;
                            cycle <= 0;
                        end
                        4'b1100: begin // JUMP
                            jump <= 1;
                            jumpaddress <= data;
                            cycle <= 0;
                        end
                        4'b1101: begin // JUMP_CARRY
                            jump <= carryout;
                            jumpaddress <= data;
                            cycle <= 0;
                        end
                        default: begin
                            cycle <= 3;
                        end
                    endcase
                end
                3: begin
                    clear <= 1;
                    cycle <= 0;
                end
            endcase
        end
    end

endmodule