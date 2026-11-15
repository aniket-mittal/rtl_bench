module autovcoder_092966 (
    input [23:0] data,  //[23:16]: byte0 [15:8]:byte1 [7:0]:byte2
    input [31:0] bytenum,
    output [15:0] tokenpos,
    output[8:0] tokenleng, ///length of token(including length of literal content) the length of token within this page
    output[16:0] lit_leng,  ///length of literal content which will go to the next page,including extra token bytes
    output [1:0] lit_minus  //length of extra token byte, minus it when calculate the length
);
  reg  [ 8:0] length;  ////length of token which will be added to curent page
  reg  [15:0] tokenpos_reg;
  reg  [17:0] lit_leng_reg;

  wire [16:0] length_lit3;  //length of literal content when the literal token is 3
  wire [8:0] space1, space2, space3;  //space left in this slice
  assign space1 = bytenum[8:0];
  assign space2 = (bytenum[8:0] > 9'b1) ? (bytenum[8:0] - 9'b1) : 9'b0;
  assign space3 = (bytenum[8:0] > 9'd2) ? (bytenum[8:0] - 9'd2) : 9'b0;
  assign length_lit3 = ({1'b0, data[15:8], data[23:16]} + 17'b1);
  always @(*) begin
    casex (data[23:16])
      8'b1111_0000: begin  //when the literal token has 2 bytes
        length <= space2;  // the length of it will be at least 16 
        tokenpos_reg <= 16'b0000_0000_0000_0000;
        lit_leng_reg <= {10'b0, data[15:8]} - {bytenum[17:0]} + 18'd2;
      end
      8'b1111_0100: begin  //when the literal token has 3 bytes
        length <= space3;  // the length of it will be at least 16 
        tokenpos_reg <= 16'b0000_0000_0000_0000;
        lit_leng_reg <= {2'b0, data[7:0], data[15:8]} - {bytenum[17:0]} + 18'd3;
      end
      8'bxxxx_xx01: begin
        length <= {5'b0, data[20:18]} + 9'd4;
        tokenpos_reg <= 16'b0111_1111_1111_1111;
        lit_leng_reg <= 16'b0;
      end
      8'bxxxx_xx10: begin
        length <= {2'b0, data[23:18]} + 9'd1;
        tokenpos_reg <= 16'b0011_1111_1111_1111;
        lit_leng_reg <= 16'b0;
      end
      default: begin
        length <= (space1 > ({3'b0, data[23:18]} + 9'b1)) ? ({3'b0, data[23:18]} + 9'b1) : space1;
        tokenpos_reg <= {16'b0111_1111_1111_1111 >> data[23:18]};
        lit_leng_reg <= {12'b0, data[23:18]} - bytenum[17:0] + 18'b1;
      end
    endcase
  end

  assign tokenpos = tokenpos_reg;
  assign tokenleng = length;
  assign lit_leng=lit_leng_reg[17]?17'b0:lit_leng_reg[16:0]; //if the number is minus, set to zero
endmodule

