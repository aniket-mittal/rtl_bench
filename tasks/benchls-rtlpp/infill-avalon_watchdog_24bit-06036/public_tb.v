// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06036 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[17:17]),
    .readdata(out_vec[16:1]),
    .resetrequest(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h1cb69b;
    stim[1] = 22'h1438b1;
    stim[2] = 22'h367a3d;
    stim[3] = 22'h3a37de;
    stim[4] = 22'h1b4fc4;
    stim[5] = 22'h2e5f4e;
    stim[6] = 22'h2fc4ca;
    stim[7] = 22'h3feb62;
    stim[8] = 22'h3f4e33;
    stim[9] = 22'h27126b;
    stim[10] = 22'h2363ad;
    stim[11] = 22'h07c662;
    stim[12] = 22'h2a87cd;
    stim[13] = 22'h06b415;
    stim[14] = 22'h0e96dc;
    stim[15] = 22'h0ee297;
    stim[16] = 22'h326257;
    stim[17] = 22'h13a4de;
    stim[18] = 22'h3f5d93;
    stim[19] = 22'h3fa4cb;
    stim[20] = 22'h1b6377;
    stim[21] = 22'h228223;
    stim[22] = 22'h3e56c2;
    stim[23] = 22'h3b62b4;
    stim[24] = 22'h06ab7c;
    stim[25] = 22'h0abe32;
    stim[26] = 22'h166ff1;
    stim[27] = 22'h3b1e4c;
    stim[28] = 22'h02c907;
    stim[29] = 22'h1f0a91;
    stim[30] = 22'h2b9453;
    stim[31] = 22'h32ad10;
    stim[32] = 22'h1a3243;
    stim[33] = 22'h3a3ccb;
    stim[34] = 22'h262a6b;
    stim[35] = 22'h273af7;
    stim[36] = 22'h2b6f53;
    stim[37] = 22'h3ade09;
    stim[38] = 22'h1acde7;
    stim[39] = 22'h0783fd;
    stim[40] = 22'h2f5b1d;
    stim[41] = 22'h1b7ddd;
    stim[42] = 22'h269165;
    stim[43] = 22'h17b143;
    stim[44] = 22'h2307f9;
    stim[45] = 22'h369248;
    stim[46] = 22'h16af78;
    stim[47] = 22'h0f5323;
    stim[48] = 22'h16da8d;
    stim[49] = 22'h36e3e9;
    stim[50] = 22'h060245;
    stim[51] = 22'h37a04e;
    stim[52] = 22'h260eb7;
    stim[53] = 22'h165ae0;
    stim[54] = 22'h16c158;
    stim[55] = 22'h3bb257;
    stim[56] = 22'h07c571;
    stim[57] = 22'h0a3362;
    stim[58] = 22'h1b8ac0;
    stim[59] = 22'h16a095;
    stim[60] = 22'h1aabed;
    stim[61] = 22'h1baf2b;
    stim[62] = 22'h23d344;
    stim[63] = 22'h32577e;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h00000;
      expv[5] = 18'h00000;
      expv[6] = 18'h00000;
      expv[7] = 18'h00000;
      expv[8] = 18'h00000;
      expv[9] = 18'h00000;
      expv[10] = 18'h00000;
      expv[11] = 18'h00000;
      expv[12] = 18'h00000;
      expv[13] = 18'h00000;
      expv[14] = 18'h00000;
      expv[15] = 18'h00000;
      expv[16] = 18'h00000;
      expv[17] = 18'h00000;
      expv[18] = 18'h00000;
      expv[19] = 18'h00000;
      expv[20] = 18'h00000;
      expv[21] = 18'h00000;
      expv[22] = 18'h00000;
      expv[23] = 18'h00000;
      expv[24] = 18'h00000;
      expv[25] = 18'h00004;
      expv[26] = 18'h00002;
      expv[27] = 18'h00000;
      expv[28] = 18'h00000;
      expv[29] = 18'h00004;
      expv[30] = 18'h00000;
      expv[31] = 18'h00000;
      expv[32] = 18'h00000;
      expv[33] = 18'h00000;
      expv[34] = 18'h00000;
      expv[35] = 18'h00000;
      expv[36] = 18'h00000;
      expv[37] = 18'h00000;
      expv[38] = 18'h00000;
      expv[39] = 18'h00000;
      expv[40] = 18'h00004;
      expv[41] = 18'h00000;
      expv[42] = 18'h00000;
      expv[43] = 18'h00000;
      expv[44] = 18'h00000;
      expv[45] = 18'h00000;
      expv[46] = 18'h00000;
      expv[47] = 18'h00000;
      expv[48] = 18'h00002;
      expv[49] = 18'h00000;
      expv[50] = 18'h00000;
      expv[51] = 18'h00004;
      expv[52] = 18'h00000;
      expv[53] = 18'h00000;
      expv[54] = 18'h00000;
      expv[55] = 18'h00000;
      expv[56] = 18'h00000;
      expv[57] = 18'h00004;
      expv[58] = 18'h00002;
      expv[59] = 18'h00000;
      expv[60] = 18'h00000;
      expv[61] = 18'h00000;
      expv[62] = 18'h00000;
      expv[63] = 18'h00000;
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
