module origen_093036(
    input [3:0] num_in,
    input [1:0] control,
    input display_sel,
    output reg [6:0] seg_out
);

    wire [6:0] seg_out_bcd, seg_out_hex, seg_out_buf;

    // BCD decoder
    assign seg_out_bcd = 
        (num_in == 4'd0) ? 7'b1000000 :
        (num_in == 4'd1) ? 7'b1111001 :
        (num_in == 4'd2) ? 7'b0100100 :
        (num_in == 4'd3) ? 7'b0110000 :
        (num_in == 4'd4) ? 7'b0011001 :
        (num_in == 4'd5) ? 7'b0010010 :
        (num_in == 4'd6) ? 7'b0000010 :
        (num_in == 4'd7) ? 7'b1111000 :
        (num_in == 4'd8) ? 7'b0000000 :
        (num_in == 4'd9) ? 7'b0010000 :
        (num_in <= 4'd11) ? 7'b0111111 : // Dash for 10-11
        7'b1110111; // Underscore for 12-15

    // Hexadecimal decoder
    assign seg_out_hex = 
        (num_in == 4'h0) ? 7'b1000000 :
        (num_in == 4'h1) ? 7'b1111001 :
        (num_in == 4'h2) ? 7'b0100100 :
        (num_in == 4'h3) ? 7'b0110000 :
        (num_in == 4'h4) ? 7'b0011001 :
        (num_in == 4'h5) ? 7'b0010010 :
        (num_in == 4'h6) ? 7'b0000010 :
        (num_in == 4'h7) ? 7'b1111000 :
        (num_in == 4'h8) ? 7'b0000000 :
        (num_in == 4'h9) ? 7'b0010000 :
        (num_in == 4'hA) ? 7'b0001000 :
        (num_in == 4'hB) ? 7'b0000011 :
        (num_in == 4'hC) ? 7'b1000110 :
        (num_in == 4'hD) ? 7'b0100001 :
        (num_in == 4'hE) ? 7'b0000110 :
        7'b0001110;

    // Select between BCD and hexadecimal output
    assign seg_out_buf = display_sel ? seg_out_bcd : seg_out_hex;

    // Final output logic
    always @(*) begin
        if (control == 2'b11 && !display_sel)
            seg_out = 7'b0001001;
        else
            seg_out = seg_out_buf;
    end

endmodule