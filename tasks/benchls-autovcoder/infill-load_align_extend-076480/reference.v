module autovcoder_076480 (
    addrtail,
    width,
    zext,
    inval,
    outval
);

  input wire [1:0] addrtail;
  input wire [1:0] width;
  input wire zext;
  input wire [31:0] inval;
  output reg [31:0] outval;

  wire [3:0] addrtail_width;
  assign addrtail_width = {addrtail, width};

  always @(*) begin
    case (addrtail_width)
      // addr mod 4 == 0, width 1, 2, 4
      4'b00_01: begin
        if (zext) outval[31:8] <= 24'b0;
        else outval[31:8] <= {24{inval[7]}};
        outval[7:0] <= inval[7:0];
      end
      4'b00_11: begin
        outval <= inval;
      end

      // addr mod 4 == 1, width 1
      4'b01_01: begin
        if (zext) outval[31:8] <= 24'b0;
        else outval[31:8] <= {24{inval[15]}};
        outval[7:0] <= inval[15:8];
      end

      // addr mod 4 == 2, width 1
      4'b10_01: begin
        if (zext) outval[31:8] <= 24'b0;
        else outval[31:8] <= {24{inval[23]}};
        outval[7:0] <= inval[23:16];
      end

      // addr mod 4 == 3, width 1
      4'b11_01: begin
        if (zext) outval[31:8] <= 24'b0;
        else outval[31:8] <= {24{inval[31]}};
        outval[7:0] <= inval[31:24];
      end

      default: outval <= 0;
    endcase
  end

endmodule

