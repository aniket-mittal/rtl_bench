module origen_206361(
    input reset,
    input [31:0] data_A,
    input [31:0] data_B,
    input [31:0] data_D_prime,
    input [9:0] PC_1,
    input [31:0] const_unit,
    input [1:0] MA_MB,
    input [1:0] HA_HB,
    output reg [31:0] bus_A,
    output reg [31:0] bus_B
);

    reg [1:0] mux_A_sel;
    reg [1:0] mux_B_sel;

    always @(*) begin
        if (reset) begin
            bus_A = 32'b0;
            bus_B = 32'b0;
        end
        else begin
            case ({HA_HB, MA_MB})
                4'b0000: begin
                    mux_A_sel = 2'b00;
                    mux_B_sel = 2'b00;
                end
                4'b0001: begin
                    mux_A_sel = 2'b01;
                    mux_B_sel = 2'b01;
                end
                4'b0010: begin
                    mux_A_sel = 2'b10;
                    mux_B_sel = 2'b10;
                end
                4'b0011: begin
                    mux_A_sel = 2'b11;
                    mux_B_sel = 2'b11;
                end
                4'b0100: begin
                    mux_A_sel = 2'b00;
                    mux_B_sel = 2'b01;
                end
                4'b0101: begin
                    mux_A_sel = 2'b01;
                    mux_B_sel = 2'b00;
                end
                4'b0110: begin
                    mux_A_sel = 2'b10;
                    mux_B_sel = 2'b11;
                end
                4'b0111: begin
                    mux_A_sel = 2'b11;
                    mux_B_sel = 2'b10;
                end
                4'b1000: begin
                    mux_A_sel = 2'b00;
                    mux_B_sel = 2'b10;
                end
                4'b1001: begin
                    mux_A_sel = 2'b01;
                    mux_B_sel = 2'b11;
                end
                4'b1010: begin
                    mux_A_sel = 2'b10;
                    mux_B_sel = 2'b00;
                end
                4'b1011: begin
                    mux_A_sel = 2'b11;
                    mux_B_sel = 2'b01;
                end
                4'b1100: begin
                    mux_A_sel = 2'b00;
                    mux_B_sel = 2'b11;
                end
                4'b1101: begin
                    mux_A_sel = 2'b01;
                    mux_B_sel = 2'b10;
                end
                4'b1110: begin
                    mux_A_sel = 2'b10;
                    mux_B_sel = 2'b01;
                end
                4'b1111: begin
                    mux_A_sel = 2'b11;
                    mux_B_sel = 2'b00;
                end
            endcase

            case (mux_A_sel)
                2'b00: bus_A = data_A;
                2'b01: bus_A = data_B;
                2'b10: bus_A = {22'b0, PC_1};
                2'b11: bus_A = data_D_prime;
            endcase

            case (mux_B_sel)
                2'b00: bus_B = data_A;
                2'b01: bus_B = data_B;
                2'b10: bus_B = const_unit;
                2'b11: bus_B = {22'b0, PC_1};
            endcase
        end
    end

endmodule