// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_099481 dut (
    .instr(in_vec[31:0]),
    .imm_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h7c3bf7f0;
    stim[1] = 32'h40773935;
    stim[2] = 32'hd06b4fae;
    stim[3] = 32'h922f12c6;
    stim[4] = 32'h069b4a21;
    stim[5] = 32'h61886b6d;
    stim[6] = 32'h7758a08b;
    stim[7] = 32'h2668553a;
    stim[8] = 32'hc27f9a47;
    stim[9] = 32'h350374ad;
    stim[10] = 32'h46a30c52;
    stim[11] = 32'h3ea63057;
    stim[12] = 32'h0bc98ee3;
    stim[13] = 32'h188153f8;
    stim[14] = 32'hb53a3336;
    stim[15] = 32'h3c4a2aca;
    stim[16] = 32'hc9edd607;
    stim[17] = 32'he4739e29;
    stim[18] = 32'h03dc7e5a;
    stim[19] = 32'h0db1bdb6;
    stim[20] = 32'hc9ed7d94;
    stim[21] = 32'hc3eb4894;
    stim[22] = 32'ha4f1dbdb;
    stim[23] = 32'hdb844f99;
    stim[24] = 32'h36000b0b;
    stim[25] = 32'hb83a46c1;
    stim[26] = 32'h16e68bb1;
    stim[27] = 32'he3e01576;
    stim[28] = 32'h07675a25;
    stim[29] = 32'ha7538128;
    stim[30] = 32'ha72a8228;
    stim[31] = 32'h7413ed9f;
    stim[32] = 32'hecfe9a37;
    stim[33] = 32'h7972e3d2;
    stim[34] = 32'h78fcf6d2;
    stim[35] = 32'h06bba8e6;
    stim[36] = 32'h5266b8e1;
    stim[37] = 32'h60c69f54;
    stim[38] = 32'he96e661f;
    stim[39] = 32'hff3c25ff;
    stim[40] = 32'hb157bb13;
    stim[41] = 32'h48e61330;
    stim[42] = 32'ha443d46b;
    stim[43] = 32'h29a7cca3;
    stim[44] = 32'h6c6e16a7;
    stim[45] = 32'hec700896;
    stim[46] = 32'h00eedb45;
    stim[47] = 32'h55ac2937;
    stim[48] = 32'hb19f2dfd;
    stim[49] = 32'h8b549402;
    stim[50] = 32'he657de2a;
    stim[51] = 32'h63325fcb;
    stim[52] = 32'hf66f39ca;
    stim[53] = 32'h7ecf2075;
    stim[54] = 32'ha378a68f;
    stim[55] = 32'he802163d;
    stim[56] = 32'h11c4a35f;
    stim[57] = 32'ha59bb128;
    stim[58] = 32'he54cffb5;
    stim[59] = 32'h9bb93f2a;
    stim[60] = 32'h993847c4;
    stim[61] = 32'h636c3985;
    stim[62] = 32'h7150596e;
    stim[63] = 32'h056a8553;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h000ecfe9;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'hfffffb15;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00055ac2;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
