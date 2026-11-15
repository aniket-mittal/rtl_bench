module origen_019631 (AD0, AD1, AD2, AD3, DO0);
    input AD0, AD1, AD2, AD3;
    output DO0;
    parameter [15:0] initval = 16'h0000;

    wire mux_out;

    function mux41;
        input [3:0] d_in;
        input [1:0] s_in;
        begin
            case (s_in)
                2'b00: mux41 = d_in[0];
                2'b01: mux41 = d_in[1];
                2'b10: mux41 = d_in[2];
                2'b11: mux41 = d_in[3];
                default: mux41 = 1'bx;
            endcase
        end
    endfunction

    function mux81;
        input [7:0] d_in;
        input [2:0] s_in;
        reg [3:0] mux4_out;
        begin
            mux4_out[0] = mux41(d_in[3:0], s_in[1:0]);
            mux4_out[1] = mux41(d_in[7:4], s_in[1:0]);
            mux81 = mux41(mux4_out, {s_in[2], 1'b0});
        end
    endfunction

    function mux16x1;
        input [15:0] d_in;
        input [3:0] s_in;
        reg [1:0] mux8_out;
        begin
            mux8_out[0] = mux81(d_in[7:0], s_in[2:0]);
            mux8_out[1] = mux81(d_in[15:8], s_in[2:0]);
            mux16x1 = mux41(mux8_out, {s_in[3], 1'b0});
        end
    endfunction

    function DataSame;
        input [1:0] v;
        begin
            if (v[0] === v[1])
                DataSame = v[0];
            else
                DataSame = 1'bx;
        end
    endfunction

    assign mux_out = mux16x1(initval, {AD3, AD2, AD1, AD0});

    buf (DO0, mux_out);

endmodule