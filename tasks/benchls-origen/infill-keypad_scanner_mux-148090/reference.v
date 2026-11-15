module origen_148090(
    input wire clk,
    input wire reset,
    input wire [3:0] row,
    output wire [3:0] col,
    input wire [3:0] A, B, C, D,
    output wire Y,
    output wire EN
);

    wire [1:0] row_out, col_out;
    wire [1:0] mux_sel;

    // Keypad scanner module
    keypad_scanner scanner(
        .clk(clk),
        .reset(reset),
        .row(row),
        .col(col),
        .row_out(row_out),
        .col_out(col_out)
    );

    // Functional module to generate multiplexer select signals
    key_to_mux_sel converter(
        .row(row_out),
        .col(col_out),
        .mux_sel(mux_sel)
    );

    // 4-to-1 multiplexer with priority encoder
    mux_4to1_priority mux(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .sel(mux_sel),
        .Y(Y),
        .EN(EN)
    );

endmodule

module keypad_scanner(
    input wire clk,
    input wire reset,
    input wire [3:0] row,
    output reg [3:0] col,
    output reg [1:0] row_out,
    output reg [1:0] col_out
);

    reg [1:0] state;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= 2'b00;
            col <= 4'b1110;
            row_out <= 2'b00;
            col_out <= 2'b00;
        end else begin
            case (state)
                2'b00: begin
                    col <= 4'b1110;
                    if (row != 4'b1111) begin
                        row_out <= (row[0] == 0) ? 2'b00 :
                                   (row[1] == 0) ? 2'b01 :
                                   (row[2] == 0) ? 2'b10 : 2'b11;
                        col_out <= 2'b00;
                    end else begin
                        state <= 2'b01;
                    end
                end
                2'b01: begin
                    col <= 4'b1101;
                    if (row != 4'b1111) begin
                        row_out <= (row[0] == 0) ? 2'b00 :
                                   (row[1] == 0) ? 2'b01 :
                                   (row[2] == 0) ? 2'b10 : 2'b11;
                        col_out <= 2'b01;
                    end else begin
                        state <= 2'b10;
                    end
                end
                2'b10: begin
                    col <= 4'b1011;
                    if (row != 4'b1111) begin
                        row_out <= (row[0] == 0) ? 2'b00 :
                                   (row[1] == 0) ? 2'b01 :
                                   (row[2] == 0) ? 2'b10 : 2'b11;
                        col_out <= 2'b10;
                    end else begin
                        state <= 2'b11;
                    end
                end
                2'b11: begin
                    col <= 4'b0111;
                    if (row != 4'b1111) begin
                        row_out <= (row[0] == 0) ? 2'b00 :
                                   (row[1] == 0) ? 2'b01 :
                                   (row[2] == 0) ? 2'b10 : 2'b11;
                        col_out <= 2'b11;
                    end else begin
                        state <= 2'b00;
                    end
                end
            endcase
        end
    end

endmodule

module key_to_mux_sel(
    input wire [1:0] row,
    input wire [1:0] col,
    output reg [1:0] mux_sel
);

    always @(*) begin
        case ({row, col})
            4'b0000: mux_sel = 2'b00; // Key 1
            4'b0001: mux_sel = 2'b00; // Key 2
            4'b0010: mux_sel = 2'b00; // Key 3
            4'b0011: mux_sel = 2'b00; // Key A
            4'b0100: mux_sel = 2'b01; // Key 4
            4'b0101: mux_sel = 2'b01; // Key 5
            4'b0110: mux_sel = 2'b01; // Key 6
            4'b0111: mux_sel = 2'b01; // Key B
            4'b1000: mux_sel = 2'b10; // Key 7
            4'b1001: mux_sel = 2'b10; // Key 8
            4'b1010: mux_sel = 2'b10; // Key 9
            4'b1011: mux_sel = 2'b10; // Key C
            4'b1100: mux_sel = 2'b11; // Key *
            4'b1101: mux_sel = 2'b11; // Key 0
            4'b1110: mux_sel = 2'b11; // Key #
            4'b1111: mux_sel = 2'b11; // Key D
            default: mux_sel = 2'b00;
        endcase
    end

endmodule

module mux_4to1_priority(
    input wire [3:0] A, B, C, D,
    input wire [1:0] sel,
    output reg Y,
    output reg EN
);

    always @(*) begin
        case (sel)
            2'b00: begin
                Y = A[0];
                EN = |A;
            end
            2'b01: begin
                Y = B[0];
                EN = |B;
            end
            2'b10: begin
                Y = C[0];
                EN = |C;
            end
            2'b11: begin
                Y = D[0];
                EN = |D;
            end
        endcase
    end

endmodule