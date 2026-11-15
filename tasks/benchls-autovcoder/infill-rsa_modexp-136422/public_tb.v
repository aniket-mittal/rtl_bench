// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_136422 dut (
    .clk(clk),
    .reset(in_vec[32:32]),
    .plaintext(in_vec[31:16]),
    .exponent(in_vec[15:0]),
    .ciphertext(out_vec[16:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h177e5545a;
    stim[1] = 33'h1e2913ffe;
    stim[2] = 33'h08678dfed;
    stim[3] = 33'h06fc23fa3;
    stim[4] = 33'h00ac77702;
    stim[5] = 33'h103c0bea7;
    stim[6] = 33'h0a1d7ae94;
    stim[7] = 33'h07a37fd91;
    stim[8] = 33'h02c1d1289;
    stim[9] = 33'h01acc75b1;
    stim[10] = 33'h014a0fd36;
    stim[11] = 33'h08475bd10;
    stim[12] = 33'h0eec85eea;
    stim[13] = 33'h0e32beddd;
    stim[14] = 33'h0ee2c9276;
    stim[15] = 33'h030c71e00;
    stim[16] = 33'h07fe1216b;
    stim[17] = 33'h0ee3e697c;
    stim[18] = 33'h0caec27f9;
    stim[19] = 33'h07d68a1f4;
    stim[20] = 33'h0d01b8ad7;
    stim[21] = 33'h0504d0d15;
    stim[22] = 33'h0267ecd37;
    stim[23] = 33'h08fc5f816;
    stim[24] = 33'h0a08a96fb;
    stim[25] = 33'h06295f46c;
    stim[26] = 33'h0f1603b44;
    stim[27] = 33'h060b9d9f9;
    stim[28] = 33'h04e175343;
    stim[29] = 33'h051060b01;
    stim[30] = 33'h0f214b82c;
    stim[31] = 33'h039c11a0e;
    stim[32] = 33'h0ae5311fb;
    stim[33] = 33'h09b032905;
    stim[34] = 33'h00d5c1cb0;
    stim[35] = 33'h0ce6946a4;
    stim[36] = 33'h0494de894;
    stim[37] = 33'h0d60e9ca5;
    stim[38] = 33'h0161c0886;
    stim[39] = 33'h0cc4e3a59;
    stim[40] = 33'h05b606c22;
    stim[41] = 33'h08ed13249;
    stim[42] = 33'h0a6f3a0f4;
    stim[43] = 33'h079a9ea2a;
    stim[44] = 33'h028cecd8d;
    stim[45] = 33'h045520305;
    stim[46] = 33'h0885eaa35;
    stim[47] = 33'h0c7e66580;
    stim[48] = 33'h08298f338;
    stim[49] = 33'h009cdab04;
    stim[50] = 33'h0f14c46fb;
    stim[51] = 33'h0b6b3468a;
    stim[52] = 33'h061f92f77;
    stim[53] = 33'h0321de2b4;
    stim[54] = 33'h07900ab3c;
    stim[55] = 33'h01ab93ca0;
    stim[56] = 33'h06587a2c2;
    stim[57] = 33'h0a8fa484c;
    stim[58] = 33'h03b25a259;
    stim[59] = 33'h0b47a96d4;
    stim[60] = 33'h06441a3ab;
    stim[61] = 33'h017f23ee1;
    stim[62] = 33'h091295fa5;
    stim[63] = 33'h058e0433b;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'hxxxxx;
      expv[2] = 17'hxxxxx;
      expv[3] = 17'hxxxxx;
      expv[4] = 17'hxxxxx;
      expv[5] = 17'hxxxxx;
      expv[6] = 17'hxxxxx;
      expv[7] = 17'hxxxxx;
      expv[8] = 17'hxxxxx;
      expv[9] = 17'hxxxxx;
      expv[10] = 17'hxxxxx;
      expv[11] = 17'hxxxxx;
      expv[12] = 17'hxxxxx;
      expv[13] = 17'hxxxxx;
      expv[14] = 17'hxxxxx;
      expv[15] = 17'hxxxxx;
      expv[16] = 17'hxxxxx;
      expv[17] = 17'hxxxxx;
      expv[18] = 17'hxxxxx;
      expv[19] = 17'hxxxxx;
      expv[20] = 17'hxxxxx;
      expv[21] = 17'hxxxxx;
      expv[22] = 17'hxxxxx;
      expv[23] = 17'hxxxxx;
      expv[24] = 17'h00000;
      expv[25] = 17'h00001;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00001;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00001;
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
