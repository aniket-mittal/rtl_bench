module origen_175594 (
    input  R1200, R2400, R4800, R9600,
    input  r_r, d_in, d_num, s_num,
    input [1:0] para,
    input [1:0] bd_rate,
    output [7:0] data_out,
    output reg err_p, err_frame
);

    reg [7:0] d_out;
    reg clk_r;
    reg [3:0] st;
    reg [3:0] stop_count;
    reg [7:0] c_clk;
    reg [3:0] n;
    reg [3:0] n_bit;

    always @(*) begin
        case (bd_rate)
            2'b00: clk_r = R1200;
            2'b01: clk_r = R2400;
            2'b10: clk_r = R4800;
            2'b11: clk_r = R9600;
        endcase
    end

    always @(posedge clk_r or negedge r_r) begin
        if (!r_r) begin
            st <= 0;
            d_out <= 0;
            err_p <= 0;
            err_frame <= 0;
            stop_count <= 0;
            c_clk <= 0;
            n <= 0;
            n_bit <= (d_num) ? 4'd7 : 4'd8;
        end else begin
            case (st)
                0: begin
                    if (!d_in) begin
                        st <= 1;
                        c_clk <= 0;
                        n <= 0;
                    end
                end
                1: begin
                    d_out[n] <= d_in;
                    c_clk <= c_clk + 1;
                    n <= n + 1;
                    if (n == n_bit - 1) begin
                        st <= 2;
                        c_clk <= 0;
                    end
                end
                2: begin
                    d_out[n] <= d_in;
                    c_clk <= c_clk + 1;
                    n <= n + 1;
                    if (n == n_bit - 1) begin
                        st <= 3;
                        c_clk <= 0;
                    end
                end
                3: begin
                    case (para)
                        2'b00: err_p <= ^d_out;
                        2'b01: err_p <= ~^d_out;
                        2'b10: err_p <= d_out[0];
                        2'b11: err_p <= ~d_out[0];
                    endcase
                    st <= 4;
                    c_clk <= 0;
                    stop_count <= 0;
                end
                4: begin
                    if (d_in) begin
                        stop_count <= stop_count + 1;
                        if (stop_count == (s_num ? 2 : 1)) begin
                            st <= 0;
                            err_frame <= 0;
                        end else begin
                            err_frame <= 1;
                        end
                    end
                end
            endcase
        end
    end

    assign data_out = d_out;

endmodule