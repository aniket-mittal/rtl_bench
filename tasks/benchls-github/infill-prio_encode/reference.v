module prio_encode (reqs,out);
input [5:0] reqs;
output [2:0] out;
reg [2:0] out;

    always @(*) begin
      case(reqs)
        // 0 is special, no reqs
        6'd0: out = 0;

        6'd1: out = 1;
        6'd2: out = 2;
        6'd3: out = 1;
        6'd4: out = 3;
        6'd5: out = 1;
        6'd6: out = 2;
        6'd7: out = 1;
        6'd8: out = 4;
        6'd9: out = 1;
        6'd10: out = 2;
        6'd11: out = 1;
        6'd12: out = 3;
        6'd13: out = 1;
        6'd14: out = 2;
        6'd15: out = 1;
        6'd16: out = 5;
        6'd17: out = 1;
        6'd18: out = 2;
        6'd19: out = 1;
        6'd20: out = 3;
        6'd21: out = 1;
        6'd22: out = 2;
        6'd23: out = 1;
        6'd24: out = 4;
        6'd25: out = 1;
        6'd26: out = 2;
        6'd27: out = 1;
        6'd28: out = 3;
        6'd29: out = 1;
        6'd30: out = 2;
        6'd31: out = 1;
        6'd32: out = 6;
        6'd33: out = 1;
        6'd34: out = 2;
        6'd35: out = 1;
        6'd36: out = 3;
        6'd37: out = 1;
        6'd38: out = 2;
        6'd39: out = 1;
        6'd40: out = 4;
        6'd41: out = 1;
        6'd42: out = 2;
        6'd43: out = 1;
        6'd44: out = 3;
        6'd45: out = 1;
        6'd46: out = 2;
        6'd47: out = 1;
        6'd48: out = 5;
        6'd49: out = 1;
        6'd50: out = 2;
        6'd51: out = 1;
        6'd52: out = 3;
        6'd53: out = 1;
        6'd54: out = 2;
        6'd55: out = 1;
        6'd56: out = 4;
        6'd57: out = 1;
        6'd58: out = 2;
        6'd59: out = 1;
        6'd60: out = 3;
        6'd61: out = 1;
        6'd62: out = 2;
        6'd63: out = 1;
      endcase
    end
endmodule