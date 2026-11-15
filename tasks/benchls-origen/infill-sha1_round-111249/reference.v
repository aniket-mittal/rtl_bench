module origen_111249(
    input [31:0] a, b, c, d, e, w,
    input [7:0] t,
    output [159:0] hash
);

    function [31:0] left_rot_5;
        input [31:0] x;
        left_rot_5 = {x[26:0], x[31:27]};
    endfunction

    function [31:0] left_rot_30;
        input [31:0] x;
        left_rot_30 = {x[1:0], x[31:2]};
    endfunction

    function [159:0] hash_op;
        input [31:0] a, b, c, d, e, w;
        input [7:0] t;
        reg [31:0] f, k, tee;
        begin
            case (t)
                8'd0, 8'd1, 8'd2, 8'd3, 8'd4, 8'd5, 8'd6, 8'd7, 8'd8, 8'd9,
                8'd10, 8'd11, 8'd12, 8'd13, 8'd14, 8'd15, 8'd16, 8'd17, 8'd18, 8'd19:
                    begin
                        k = 32'h5a827999;
                        f = (b & c) ^ (~b & d);
                    end
                8'd20, 8'd21, 8'd22, 8'd23, 8'd24, 8'd25, 8'd26, 8'd27, 8'd28, 8'd29,
                8'd30, 8'd31, 8'd32, 8'd33, 8'd34, 8'd35, 8'd36, 8'd37, 8'd38, 8'd39:
                    begin
                        k = 32'h6ed9eba1;
                        f = b ^ c ^ d;
                    end
                8'd40, 8'd41, 8'd42, 8'd43, 8'd44, 8'd45, 8'd46, 8'd47, 8'd48, 8'd49,
                8'd50, 8'd51, 8'd52, 8'd53, 8'd54, 8'd55, 8'd56, 8'd57, 8'd58, 8'd59:
                    begin
                        k = 32'h8f1bbcdc;
                        f = (b & c) | (b & d) | (c & d);
                    end
                default: // 60-79
                    begin
                        k = 32'hca62c1d6;
                        f = b ^ c ^ d;
                    end
            endcase
            tee = left_rot_5(a) + f + e + k + w;
            hash_op = {tee, a, left_rot_30(b), c, d};
        end
    endfunction

    assign hash = hash_op(a, b, c, d, e, w, t);

endmodule