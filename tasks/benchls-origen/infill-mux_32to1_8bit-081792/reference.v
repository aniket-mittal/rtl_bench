module origen_081792 (
    input [7:0] in0, in1, in2, in3, in4, in5, in6, in7,
    input [7:0] in8, in9, in10, in11, in12, in13, in14, in15,
    input [7:0] in16, in17, in18, in19, in20, in21, in22, in23,
    input [7:0] in24, in25, in26, in27, in28, in29, in30, in31,
    input [4:0] cnt,
    output [7:0] out
);

reg [7:0] value;

always @(*) begin
    case(cnt)
        5'd0: value = in0;
        5'd1: value = in1;
        5'd2: value = in2;
        5'd3: value = in3;
        5'd4: value = in4;
        5'd5: value = in5;
        5'd6: value = in6;
        5'd7: value = in7;
        5'd8: value = in8;
        5'd9: value = in9;
        5'd10: value = in10;
        5'd11: value = in11;
        5'd12: value = in12;
        5'd13: value = in13;
        5'd14: value = in14;
        5'd15: value = in15;
        5'd16: value = in16;
        5'd17: value = in17;
        5'd18: value = in18;
        5'd19: value = in19;
        5'd20: value = in20;
        5'd21: value = in21;
        5'd22: value = in22;
        5'd23: value = in23;
        5'd24: value = in24;
        5'd25: value = in25;
        5'd26: value = in26;
        5'd27: value = in27;
        5'd28: value = in28;
        5'd29: value = in29;
        5'd30: value = in30;
        5'd31: value = in31;
        default: value = 8'b0;
    endcase
end

assign out = value;

endmodule