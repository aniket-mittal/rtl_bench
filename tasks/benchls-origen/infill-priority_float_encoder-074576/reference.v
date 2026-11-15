module origen_074576 (
    input [11:0] d_in,
    output reg [2:0] exp,
    output reg [3:0] sig,
    output reg fifth
);

    always @(*) begin
        if (d_in[11:10] != 2'b00) begin
            exp = 3'd7;
            sig = d_in[11:8];
            fifth = d_in[7];
        end
        else if (d_in[9]) begin
            exp = 3'd6;
            sig = d_in[9:6];
            fifth = d_in[5];
        end
        else if (d_in[8]) begin
            exp = 3'd5;
            sig = d_in[8:5];
            fifth = d_in[4];
        end
        else if (d_in[7]) begin
            exp = 3'd4;
            sig = d_in[7:4];
            fifth = d_in[3];
        end
        else if (d_in[6]) begin
            exp = 3'd3;
            sig = d_in[6:3];
            fifth = d_in[2];
        end
        else if (d_in[5]) begin
            exp = 3'd2;
            sig = d_in[5:2];
            fifth = d_in[1];
        end
        else if (d_in[4]) begin
            exp = 3'd1;
            sig = d_in[4:1];
            fifth = d_in[0];
        end
        else begin
            exp = 3'd0;
            sig = d_in[3:0];
            fifth = 1'b0;
        end
    end

endmodule