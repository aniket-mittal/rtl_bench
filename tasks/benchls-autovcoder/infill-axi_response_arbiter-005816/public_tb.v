// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005816 dut (
    .ACLK(clk),
    .ARESETn(in_vec[28:28]),
    .BSELECT(in_vec[27:24]),
    .BVALID(in_vec[23:20]),
    .BREADY(in_vec[19:16]),
    .RSELECT(in_vec[15:12]),
    .RVALID(in_vec[11:8]),
    .RREADY(in_vec[7:4]),
    .RLAST(in_vec[3:0]),
    .BGRANT(out_vec[7:4]),
    .RGRANT(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h0bbc23ff;
    stim[1] = 29'h0cbb76b6;
    stim[2] = 29'h1aa990e2;
    stim[3] = 29'h17be25ab;
    stim[4] = 29'h100ab23d;
    stim[5] = 29'h1290fed1;
    stim[6] = 29'h12d3d30e;
    stim[7] = 29'h18cee652;
    stim[8] = 29'h0c737026;
    stim[9] = 29'h0795a215;
    stim[10] = 29'h1dabfe93;
    stim[11] = 29'h16cccdc7;
    stim[12] = 29'h19c9ed96;
    stim[13] = 29'h131920f8;
    stim[14] = 29'h19dd4bb7;
    stim[15] = 29'h134e87d1;
    stim[16] = 29'h13606b66;
    stim[17] = 29'h13fad253;
    stim[18] = 29'h1a7170b8;
    stim[19] = 29'h1f0b8c77;
    stim[20] = 29'h14b1889e;
    stim[21] = 29'h14aceff2;
    stim[22] = 29'h1d15cb6f;
    stim[23] = 29'h16a40b7f;
    stim[24] = 29'h161f08f4;
    stim[25] = 29'h1b942e5b;
    stim[26] = 29'h1a5c7c56;
    stim[27] = 29'h179dbf2c;
    stim[28] = 29'h1abeb6c3;
    stim[29] = 29'h1d5fb584;
    stim[30] = 29'h1d070787;
    stim[31] = 29'h1c6afbe1;
    stim[32] = 29'h12949100;
    stim[33] = 29'h12733912;
    stim[34] = 29'h1b1a5a95;
    stim[35] = 29'h1d1f8883;
    stim[36] = 29'h1251fa24;
    stim[37] = 29'h1425e93e;
    stim[38] = 29'h159f0037;
    stim[39] = 29'h1637fa15;
    stim[40] = 29'h1620e1fb;
    stim[41] = 29'h07ffc2d1;
    stim[42] = 29'h14f2cd14;
    stim[43] = 29'h11515328;
    stim[44] = 29'h146457ca;
    stim[45] = 29'h16052342;
    stim[46] = 29'h0a6b18f8;
    stim[47] = 29'h184ead33;
    stim[48] = 29'h1ef6858e;
    stim[49] = 29'h1089207e;
    stim[50] = 29'h18758ee2;
    stim[51] = 29'h1b0e2cee;
    stim[52] = 29'h15bcad87;
    stim[53] = 29'h1cffdfc4;
    stim[54] = 29'h196b1f5a;
    stim[55] = 29'h1bbacc01;
    stim[56] = 29'h13ad34c0;
    stim[57] = 29'h1516fe9d;
    stim[58] = 29'h1da6bbf8;
    stim[59] = 29'h1ba151b5;
    stim[60] = 29'h1bc09fc6;
    stim[61] = 29'h12efb01f;
    stim[62] = 29'h1b082129;
    stim[63] = 29'h12af6489;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'h12;
      expv[1] = 8'h82;
      expv[2] = 8'h20;
      expv[3] = 8'h20;
      expv[4] = 8'h02;
      expv[5] = 8'h02;
      expv[6] = 8'h02;
      expv[7] = 8'h82;
      expv[8] = 8'h40;
      expv[9] = 8'h12;
      expv[10] = 8'h82;
      expv[11] = 8'h42;
      expv[12] = 8'h82;
      expv[13] = 8'h12;
      expv[14] = 8'h12;
      expv[15] = 8'h00;
      expv[16] = 8'h22;
      expv[17] = 8'h20;
      expv[18] = 8'h20;
      expv[19] = 8'h28;
      expv[20] = 8'h28;
      expv[21] = 8'h22;
      expv[22] = 8'h28;
      expv[23] = 8'h28;
      expv[24] = 8'h28;
      expv[25] = 8'h28;
      expv[26] = 8'h28;
      expv[27] = 8'h28;
      expv[28] = 8'h28;
      expv[29] = 8'h18;
      expv[30] = 8'h08;
      expv[31] = 8'h48;
      expv[32] = 8'h48;
      expv[33] = 8'h48;
      expv[34] = 8'h48;
      expv[35] = 8'h48;
      expv[36] = 8'h48;
      expv[37] = 8'h48;
      expv[38] = 8'h48;
      expv[39] = 8'h48;
      expv[40] = 8'h48;
      expv[41] = 8'h10;
      expv[42] = 8'h44;
      expv[43] = 8'h44;
      expv[44] = 8'h44;
      expv[45] = 8'h04;
      expv[46] = 8'h20;
      expv[47] = 8'h08;
      expv[48] = 8'h28;
      expv[49] = 8'h08;
      expv[50] = 8'h08;
      expv[51] = 8'h08;
      expv[52] = 8'h18;
      expv[53] = 8'h18;
      expv[54] = 8'h08;
      expv[55] = 8'h18;
      expv[56] = 8'h18;
      expv[57] = 8'h18;
      expv[58] = 8'h11;
      expv[59] = 8'h11;
      expv[60] = 8'h11;
      expv[61] = 8'h11;
      expv[62] = 8'h11;
      expv[63] = 8'h11;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
