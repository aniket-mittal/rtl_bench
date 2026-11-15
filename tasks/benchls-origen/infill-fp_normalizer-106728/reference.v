module origen_106728 (
    input [7:0] in_e,
    input [24:0] in_m,
    output reg [7:0] out_e,
    output reg [24:0] out_m
);

always @(*) begin
    if (in_m[23]) begin
        out_m = in_m;
        out_e = in_e;
    end
    else if (in_m[22]) begin
        out_m = {in_m[22:0], 1'b0};
        out_e = in_e - 8'd1;
    end
    else if (in_m[21]) begin
        out_m = {in_m[21:0], 2'b0};
        out_e = in_e - 8'd2;
    end
    else if (in_m[20]) begin
        out_m = {in_m[20:0], 3'b0};
        out_e = in_e - 8'd3;
    end
    else if (in_m[19]) begin
        out_m = {in_m[19:0], 4'b0};
        out_e = in_e - 8'd4;
    end
    else if (in_m[18]) begin
        out_m = {in_m[18:0], 5'b0};
        out_e = in_e - 8'd5;
    end
    else if (in_m[17]) begin
        out_m = {in_m[17:0], 6'b0};
        out_e = in_e - 8'd6;
    end
    else if (in_m[16]) begin
        out_m = {in_m[16:0], 7'b0};
        out_e = in_e - 8'd7;
    end
    else if (in_m[15]) begin
        out_m = {in_m[15:0], 8'b0};
        out_e = in_e - 8'd8;
    end
    else if (in_m[14]) begin
        out_m = {in_m[14:0], 9'b0};
        out_e = in_e - 8'd9;
    end
    else if (in_m[13]) begin
        out_m = {in_m[13:0], 10'b0};
        out_e = in_e - 8'd10;
    end
    else if (in_m[12]) begin
        out_m = {in_m[12:0], 11'b0};
        out_e = in_e - 8'd11;
    end
    else if (in_m[11]) begin
        out_m = {in_m[11:0], 12'b0};
        out_e = in_e - 8'd12;
    end
    else if (in_m[10]) begin
        out_m = {in_m[10:0], 13'b0};
        out_e = in_e - 8'd13;
    end
    else if (in_m[9]) begin
        out_m = {in_m[9:0], 14'b0};
        out_e = in_e - 8'd14;
    end
    else if (in_m[8]) begin
        out_m = {in_m[8:0], 15'b0};
        out_e = in_e - 8'd15;
    end
    else if (in_m[7]) begin
        out_m = {in_m[7:0], 16'b0};
        out_e = in_e - 8'd16;
    end
    else if (in_m[6]) begin
        out_m = {in_m[6:0], 17'b0};
        out_e = in_e - 8'd17;
    end
    else if (in_m[5]) begin
        out_m = {in_m[5:0], 18'b0};
        out_e = in_e - 8'd18;
    end
    else if (in_m[4]) begin
        out_m = {in_m[4:0], 19'b0};
        out_e = in_e - 8'd19;
    end
    else if (in_m[3]) begin
        out_m = {in_m[3:0], 20'b0};
        out_e = in_e - 8'd20;
    end
    else begin
        out_m = in_m;
        out_e = in_e;
    end
end

endmodule