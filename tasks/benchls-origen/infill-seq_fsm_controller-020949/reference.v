module origen_020949 (
    input wire Bandera,
    input wire clk,
    output wire [2:0] sel_const,
    output wire [1:0] sel_fun,
    output wire [1:0] sel_acum,
    output wire Band_Listo,
    output wire Senal
);

    reg [2:0] state, next_state;
    reg [2:0] sel_const_reg;
    reg [1:0] sel_fun_reg;
    reg [1:0] sel_acum_reg;
    reg Band_Listo_reg;
    reg Senal_reg;

    // State register
    always @(posedge clk) begin
        state <= next_state;
    end

    // Next state and output logic
    always @(*) begin
        case (state)
            3'b000: begin
                if (Bandera) next_state = 3'b001;
                else next_state = 3'b000;
                sel_const_reg = 3'b000;
                sel_fun_reg = 2'b00;
                sel_acum_reg = 2'b00;
                Band_Listo_reg = 1'b0;
                Senal_reg = 1'b0;
            end
            3'b001: begin
                next_state = 3'b010;
                sel_const_reg = 3'b001;
                sel_fun_reg = 2'b01;
                sel_acum_reg = 2'b01;
                Band_Listo_reg = 1'b0;
                Senal_reg = 1'b0;
            end
            3'b010: begin
                next_state = 3'b011;
                sel_const_reg = 3'b010;
                sel_fun_reg = 2'b10;
                sel_acum_reg = 2'b10;
                Band_Listo_reg = 1'b0;
                Senal_reg = 1'b0;
            end
            3'b011: begin
                next_state = 3'b100;
                sel_const_reg = 3'b011;
                sel_fun_reg = 2'b11;
                sel_acum_reg = 2'b11;
                Band_Listo_reg = 1'b0;
                Senal_reg = 1'b1;
            end
            3'b100: begin
                next_state = 3'b101;
                sel_const_reg = 3'b100;
                sel_fun_reg = 2'b00;
                sel_acum_reg = 2'b00;
                Band_Listo_reg = 1'b0;
                Senal_reg = 1'b0;
            end
            3'b101: begin
                next_state = 3'b110;
                sel_const_reg = 3'b101;
                sel_fun_reg = 2'b01;
                sel_acum_reg = 2'b01;
                Band_Listo_reg = 1'b0;
                Senal_reg = 1'b0;
            end
            3'b110: begin
                next_state = 3'b000;
                sel_const_reg = 3'b110;
                sel_fun_reg = 2'b10;
                sel_acum_reg = 2'b10;
                Band_Listo_reg = 1'b1;
                Senal_reg = 1'b0;
            end
            default: begin
                next_state = 3'b000;
                sel_const_reg = 3'b000;
                sel_fun_reg = 2'b00;
                sel_acum_reg = 2'b00;
                Band_Listo_reg = 1'b0;
                Senal_reg = 1'b0;
            end
        endcase
    end

    // Output assignments
    assign sel_const = sel_const_reg;
    assign sel_fun = sel_fun_reg;
    assign sel_acum = sel_acum_reg;
    assign Band_Listo = Band_Listo_reg;
    assign Senal = Senal_reg;

endmodule