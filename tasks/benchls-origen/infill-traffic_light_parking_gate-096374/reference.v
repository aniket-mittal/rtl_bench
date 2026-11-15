module origen_096374(
    input clk_2,
    input [7:0] SWI,
    output reg [7:0] LED,
    output [7:0] SEG,
    output [7:0] lcd_a, lcd_b,
    output [7:0] lcd_instruction,
    output [7:0] lcd_registrador,
    output [7:0] lcd_pc,
    output [7:0] lcd_SrcA, lcd_SrcB,
    output [7:0] lcd_ALUResult,
    output [7:0] lcd_Result,
    output [7:0] lcd_WriteData,
    output [7:0] lcd_ReadData,
    output lcd_MemWrite,
    output lcd_Branch,
    output lcd_MemtoReg,
    output lcd_RegWrite
);

    reg [3:0] num_carros;
    reg cancela_entrada, cancela_saida;
    reg [3:0] estado_atual;
    reg clk_1;
    wire reset;

    localparam q0 = 4'b0000, q1 = 4'b0001, q2 = 4'b0010, q3 = 4'b0011, q4 = 4'b0100;

    assign reset = SWI[6];

    always @(posedge clk_2 or posedge reset) begin
        if (reset) begin
            estado_atual <= q0;
            num_carros <= 4'b0000;
            cancela_entrada <= 1'b0;
            cancela_saida <= 1'b0;
            clk_1 <= 1'b0;
        end else begin
            clk_1 <= ~clk_1;
            case (estado_atual)
                q0: begin
                    if (SWI[0] && num_carros < 4'b1010)
                        estado_atual <= q1;
                    else if (SWI[7] && num_carros > 4'b0000)
                        estado_atual <= q3;
                end
                q1: begin
                    if (!SWI[0])
                        estado_atual <= q2;
                end
                q2: begin
                    num_carros <= num_carros + 1;
                    estado_atual <= q0;
                end
                q3: begin
                    if (!SWI[7])
                        estado_atual <= q4;
                end
                q4: begin
                    num_carros <= num_carros - 1;
                    estado_atual <= q0;
                end
                default: estado_atual <= q0;
            endcase
        end
    end

    always @(*) begin
        LED[6:3] = num_carros;
        LED[0] = SWI[0];
        LED[1] = SWI[7];
        LED[7] = clk_1;
    end

    // Unused outputs
    assign SEG = 8'b0;
    assign lcd_a = 8'b0;
    assign lcd_b = 8'b0;
    assign lcd_instruction = 8'b0;
    assign lcd_registrador = 8'b0;
    assign lcd_pc = 8'b0;
    assign lcd_SrcA = 8'b0;
    assign lcd_SrcB = 8'b0;
    assign lcd_ALUResult = 8'b0;
    assign lcd_Result = 8'b0;
    assign lcd_WriteData = 8'b0;
    assign lcd_ReadData = 8'b0;
    assign lcd_MemWrite = 1'b0;
    assign lcd_Branch = 1'b0;
    assign lcd_MemtoReg = 1'b0;
    assign lcd_RegWrite = 1'b0;

endmodule