module origen_111270 #(
    parameter width_a = 4,
    parameter signd_a = 1,
    parameter width_s = 2,
    parameter width_z = 8
) (
    input [width_a-1:0] a,
    input [width_s-1:0] s,
    output [width_z-1:0] z
);

    function automatic [width_z-1:0] fshl_u_1(input [width_a-1:0] a, input [width_z-width_a-1:0] fill);
        fshl_u_1 = {a, fill};
    endfunction

    function automatic [width_z-1:0] fshl_u(input [width_a-1:0] a, input [width_s-1:0] s, input [width_z-width_a-1:0] fill);
        fshl_u = fshl_u_1(a, fill) << s;
    endfunction

    function automatic [width_z-1:0] fshr_u(input [width_a-1:0] a, input [width_s-1:0] s, input [width_z-width_a-1:0] fill);
        fshr_u = (fshl_u_1(a, fill) >> s) | (fill << (width_z - s));
    endfunction

    function automatic [width_z-1:0] fshl_s(input [width_a-1:0] a, input [width_s-1:0] s);
        reg sign;
        reg [width_z-width_a-1:0] fill;
        begin
            sign = signd_a ? a[width_a-1] : 1'b0;
            fill = {(width_z-width_a){sign}};
            fshl_s = s[width_s-1] ? fshr_u(a, ~s + 1'b1, fill) : fshl_u(a, s, fill);
        end
    endfunction

    assign z = fshl_s(a, s);

endmodule

module top #(
    parameter width_a = 240,
    parameter width_s = 9,
    parameter width_z = 240
) (
    input [width_a-1:0] a,
    input [width_s-1:0] s,
    output [width_z-1:0] z
);

    shift #(
        .width_a(width_a),
        .signd_a(1),
        .width_s(width_s),
        .width_z(width_z)
    ) shift_inst (
        .a(a),
        .s(s),
        .z(z)
    );

endmodule