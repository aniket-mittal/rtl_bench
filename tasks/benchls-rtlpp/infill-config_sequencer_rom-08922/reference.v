module rtlpp_08922 (
  input wire clk,
  input wire resend,
  input wire advance,
  output wire [15:0] command,
  output reg finished
);

  reg [15:0] sreg;
  reg [7:0] address = 8'b0;

  assign command = sreg;

  always @(*) begin
    if (sreg == 16'hFFFF)
      finished = 1'b1;
    else
      finished = 1'b0;
  end

  always @(posedge clk) begin
    if (resend == 1'b1) begin
      address <= 8'b0;
    end
    else if (advance == 1'b1) begin
      address <= address + 1;
    end
    
    case (address)
      8'h00 : sreg <= 16'h1280;
      8'h01 : sreg <= 16'h1280;
      8'h02 : sreg <= 16'h1204;
      8'h03 : sreg <= 16'h1100;
      8'h04 : sreg <= 16'h0C00;
      8'h05 : sreg <= 16'h3E00;
      8'h06 : sreg <= 16'h8C00;
      8'h07 : sreg <= 16'h0400;
      8'h08 : sreg <= 16'h4010;
      8'h09 : sreg <= 16'h3A04;
      8'h0A : sreg <= 16'h1438;
      8'h0B : sreg <= 16'h4F40;
      8'h0C : sreg <= 16'h5034;
      8'h0D : sreg <= 16'h510C;
      8'h0E : sreg <= 16'h5217;
      8'h0F : sreg <= 16'h5329;
      8'h10 : sreg <= 16'h5440;
      8'h11 : sreg <= 16'h581E;
      8'h12 : sreg <= 16'h3DC0;
      8'h13 : sreg <= 16'h1100;
      8'h14 : sreg <= 16'h1711;
      8'h15 : sreg <= 16'h1861;
      8'h16 : sreg <= 16'h32A4;
      8'h17 : sreg <= 16'h1903;
      8'h18 : sreg <= 16'h1A7B;
      8'h19 : sreg <= 16'h030A;
      8'h1A : sreg <= 16'h0E61;
      8'h1B : sreg <= 16'h0F4B;
      8'h1C : sreg <= 16'h1602;
      8'h1D : sreg <= 16'h1E37;
      8'h1E : sreg <= 16'h2102;
      8'h1F : sreg <= 16'h2291;
      8'h20 : sreg <= 16'h2907;
      8'h21 : sreg <= 16'h330B;
      8'h22 : sreg <= 16'h350B;
      8'h23 : sreg <= 16'h371D;
      8'h24 : sreg <= 16'h3871;
      8'h25 : sreg <= 16'h392A;
      8'h26 : sreg <= 16'h3C78;
      8'h27 : sreg <= 16'h4D40;
      8'h28 : sreg <= 16'h4E20;
      8'h29 : sreg <= 16'h6900;
      8'h2A : sreg <= 16'h6B4A;
      8'h2B : sreg <= 16'h7410;
      8'h2C : sreg <= 16'h8D4F;
      8'h2D : sreg <= 16'h8E00;
      8'h2E : sreg <= 16'h8F00;
      8'h2F : sreg <= 16'h9000;
      8'h30 : sreg <= 16'h9100;
      8'h31 : sreg <= 16'h9600;
      8'h32 : sreg <= 16'h9A00;
      8'h33 : sreg <= 16'hB084;
      8'h34 : sreg <= 16'hB10C;
      8'h35 : sreg <= 16'hB20E;
      8'h36 : sreg <= 16'hB382;
      8'h37 : sreg <= 16'hB80A;
      default : sreg <= 16'hFFFF;
    endcase
  end

endmodule