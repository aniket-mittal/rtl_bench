// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_001572 dut (
    .opcode(in_vec[11:6]),
    .func(in_vec[5:0]),
    .PCsel(out_vec[13:12]),
    .EXTsel(out_vec[11:10]),
    .ALUsel(out_vec[9:7]),
    .Bsel(out_vec[6:6]),
    .DMEn(out_vec[5:5]),
    .A3sel(out_vec[4:3]),
    .WDsel(out_vec[2:1]),
    .GRFEn(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h2dc;
    stim[1] = 12'h011;
    stim[2] = 12'hf81;
    stim[3] = 12'hb6d;
    stim[4] = 12'h987;
    stim[5] = 12'hef0;
    stim[6] = 12'h638;
    stim[7] = 12'ha6d;
    stim[8] = 12'ha01;
    stim[9] = 12'hf19;
    stim[10] = 12'h997;
    stim[11] = 12'hfd9;
    stim[12] = 12'h9b9;
    stim[13] = 12'h22a;
    stim[14] = 12'hf78;
    stim[15] = 12'hef8;
    stim[16] = 12'hc46;
    stim[17] = 12'h3bc;
    stim[18] = 12'hb27;
    stim[19] = 12'he75;
    stim[20] = 12'h2f1;
    stim[21] = 12'hff4;
    stim[22] = 12'h092;
    stim[23] = 12'haff;
    stim[24] = 12'h9e7;
    stim[25] = 12'h5d8;
    stim[26] = 12'he98;
    stim[27] = 12'he26;
    stim[28] = 12'h48c;
    stim[29] = 12'hfab;
    stim[30] = 12'h470;
    stim[31] = 12'hcfa;
    stim[32] = 12'hb51;
    stim[33] = 12'hac1;
    stim[34] = 12'h58f;
    stim[35] = 12'h8fb;
    stim[36] = 12'h5f2;
    stim[37] = 12'hb1d;
    stim[38] = 12'hc06;
    stim[39] = 12'ha07;
    stim[40] = 12'hf9c;
    stim[41] = 12'h42a;
    stim[42] = 12'h2fd;
    stim[43] = 12'h81f;
    stim[44] = 12'h52d;
    stim[45] = 12'h8ab;
    stim[46] = 12'hce0;
    stim[47] = 12'h272;
    stim[48] = 12'h24a;
    stim[49] = 12'h08d;
    stim[50] = 12'h484;
    stim[51] = 12'h764;
    stim[52] = 12'h91c;
    stim[53] = 12'he71;
    stim[54] = 12'h714;
    stim[55] = 12'hbbf;
    stim[56] = 12'hca4;
    stim[57] = 12'hef3;
    stim[58] = 12'h6b7;
    stim[59] = 12'hdfc;
    stim[60] = 12'h0e0;
    stim[61] = 12'h9e9;
    stim[62] = 12'hcf6;
    stim[63] = 12'hf07;
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
      expv[0] = 14'h0000;
      expv[1] = 14'h0000;
      expv[2] = 14'h0000;
      expv[3] = 14'h0000;
      expv[4] = 14'h0000;
      expv[5] = 14'h0000;
      expv[6] = 14'h0000;
      expv[7] = 14'h0000;
      expv[8] = 14'h0000;
      expv[9] = 14'h0000;
      expv[10] = 14'h0000;
      expv[11] = 14'h0000;
      expv[12] = 14'h0000;
      expv[13] = 14'h0000;
      expv[14] = 14'h0000;
      expv[15] = 14'h0000;
      expv[16] = 14'h0000;
      expv[17] = 14'h0000;
      expv[18] = 14'h0000;
      expv[19] = 14'h0000;
      expv[20] = 14'h0000;
      expv[21] = 14'h0000;
      expv[22] = 14'h2000;
      expv[23] = 14'h0460;
      expv[24] = 14'h0000;
      expv[25] = 14'h0000;
      expv[26] = 14'h0000;
      expv[27] = 14'h0000;
      expv[28] = 14'h0000;
      expv[29] = 14'h0000;
      expv[30] = 14'h0000;
      expv[31] = 14'h0000;
      expv[32] = 14'h0000;
      expv[33] = 14'h0460;
      expv[34] = 14'h0000;
      expv[35] = 14'h044d;
      expv[36] = 14'h0000;
      expv[37] = 14'h0000;
      expv[38] = 14'h0000;
      expv[39] = 14'h0000;
      expv[40] = 14'h0000;
      expv[41] = 14'h0000;
      expv[42] = 14'h0000;
      expv[43] = 14'h0000;
      expv[44] = 14'h0000;
      expv[45] = 14'h0000;
      expv[46] = 14'h0000;
      expv[47] = 14'h0000;
      expv[48] = 14'h0000;
      expv[49] = 14'h2000;
      expv[50] = 14'h0000;
      expv[51] = 14'h0000;
      expv[52] = 14'h0000;
      expv[53] = 14'h0000;
      expv[54] = 14'h0000;
      expv[55] = 14'h0000;
      expv[56] = 14'h0000;
      expv[57] = 14'h0000;
      expv[58] = 14'h0000;
      expv[59] = 14'h0000;
      expv[60] = 14'h2017;
      expv[61] = 14'h0000;
      expv[62] = 14'h0000;
      expv[63] = 14'h0000;
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
