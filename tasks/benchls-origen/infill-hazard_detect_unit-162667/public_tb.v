// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_162667 dut (
    .OpCode(in_vec[38:33]),
    .EX_RegW(in_vec[32:32]),
    .EX_MemRead(in_vec[31:31]),
    .EX_RegRD(in_vec[30:26]),
    .ID_RegRS(in_vec[25:21]),
    .ID_RegRT(in_vec[20:16]),
    .M_RegRD(in_vec[15:11]),
    .EX_RegRS(in_vec[10:6]),
    .EX_RegRT(in_vec[5:1]),
    .M_MemRead(in_vec[0:0]),
    .IF_WriteSel_ID(out_vec[4:4]),
    .ControlNopSel(out_vec[3:3]),
    .PCWriteSel(out_vec[2:2]),
    .EXMemEn(out_vec[1:1]),
    .controlNopSelMem(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h234c9b6119;
    stim[1] = 39'h7eb058a4e0;
    stim[2] = 39'h771a6e32a6;
    stim[3] = 39'h52bae2da6b;
    stim[4] = 39'h2997bcedd6;
    stim[5] = 39'h5a67d32f98;
    stim[6] = 39'h477f66bbd9;
    stim[7] = 39'h53799c9717;
    stim[8] = 39'h02c7294dc0;
    stim[9] = 39'h7a662ebc74;
    stim[10] = 39'h367fd4d366;
    stim[11] = 39'h30d57d7695;
    stim[12] = 39'h3ff88a09bc;
    stim[13] = 39'h63f5ee184f;
    stim[14] = 39'h051a9af400;
    stim[15] = 39'h315b7d2c8a;
    stim[16] = 39'h4ee0735009;
    stim[17] = 39'h40a9d5af71;
    stim[18] = 39'h09e7fe3a86;
    stim[19] = 39'h071c43b33e;
    stim[20] = 39'h63454b300e;
    stim[21] = 39'h5a06efbc4d;
    stim[22] = 39'h606353153c;
    stim[23] = 39'h0feffa1dde;
    stim[24] = 39'h56c02d09f4;
    stim[25] = 39'h05b01172a0;
    stim[26] = 39'h38cdabd167;
    stim[27] = 39'h3fe73f73a3;
    stim[28] = 39'h446ca7acb5;
    stim[29] = 39'h16a9801512;
    stim[30] = 39'h0740d47da2;
    stim[31] = 39'h22974abe2d;
    stim[32] = 39'h1f62283315;
    stim[33] = 39'h601b712cef;
    stim[34] = 39'h1605ca7987;
    stim[35] = 39'h512aded562;
    stim[36] = 39'h1a0d9ace82;
    stim[37] = 39'h585f515116;
    stim[38] = 39'h68e75afe6b;
    stim[39] = 39'h2b798fdb35;
    stim[40] = 39'h2c8993724d;
    stim[41] = 39'h689de6cf93;
    stim[42] = 39'h3c536bdb88;
    stim[43] = 39'h22c7d57aa4;
    stim[44] = 39'h2d41f86826;
    stim[45] = 39'h70917f3684;
    stim[46] = 39'h7f03b8fb1d;
    stim[47] = 39'h0301fc99d2;
    stim[48] = 39'h290b974658;
    stim[49] = 39'h45e33bc8ee;
    stim[50] = 39'h5db6a2dbfd;
    stim[51] = 39'h69d8f5c484;
    stim[52] = 39'h1a1928c7cb;
    stim[53] = 39'h220289c487;
    stim[54] = 39'h67856bbf28;
    stim[55] = 39'h33fcc49ac8;
    stim[56] = 39'h65eb790892;
    stim[57] = 39'h552be9b322;
    stim[58] = 39'h602d407d3f;
    stim[59] = 39'h0c61f0d867;
    stim[60] = 39'h1df51481b7;
    stim[61] = 39'h4a142d8a0a;
    stim[62] = 39'h6478a80986;
    stim[63] = 39'h071f738ac1;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 5'h16;
      expv[1] = 5'h16;
      expv[2] = 5'h16;
      expv[3] = 5'h16;
      expv[4] = 5'h16;
      expv[5] = 5'h16;
      expv[6] = 5'h16;
      expv[7] = 5'h16;
      expv[8] = 5'h16;
      expv[9] = 5'h16;
      expv[10] = 5'h16;
      expv[11] = 5'h16;
      expv[12] = 5'h16;
      expv[13] = 5'h16;
      expv[14] = 5'h16;
      expv[15] = 5'h16;
      expv[16] = 5'h16;
      expv[17] = 5'h16;
      expv[18] = 5'h16;
      expv[19] = 5'h16;
      expv[20] = 5'h16;
      expv[21] = 5'h16;
      expv[22] = 5'h16;
      expv[23] = 5'h16;
      expv[24] = 5'h16;
      expv[25] = 5'h16;
      expv[26] = 5'h16;
      expv[27] = 5'h16;
      expv[28] = 5'h16;
      expv[29] = 5'h16;
      expv[30] = 5'h16;
      expv[31] = 5'h16;
      expv[32] = 5'h16;
      expv[33] = 5'h16;
      expv[34] = 5'h16;
      expv[35] = 5'h16;
      expv[36] = 5'h16;
      expv[37] = 5'h16;
      expv[38] = 5'h16;
      expv[39] = 5'h16;
      expv[40] = 5'h16;
      expv[41] = 5'h16;
      expv[42] = 5'h16;
      expv[43] = 5'h16;
      expv[44] = 5'h16;
      expv[45] = 5'h16;
      expv[46] = 5'h16;
      expv[47] = 5'h16;
      expv[48] = 5'h16;
      expv[49] = 5'h16;
      expv[50] = 5'h16;
      expv[51] = 5'h16;
      expv[52] = 5'h16;
      expv[53] = 5'h16;
      expv[54] = 5'h16;
      expv[55] = 5'h16;
      expv[56] = 5'h16;
      expv[57] = 5'h16;
      expv[58] = 5'h16;
      expv[59] = 5'h16;
      expv[60] = 5'h16;
      expv[61] = 5'h16;
      expv[62] = 5'h16;
      expv[63] = 5'h16;
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
