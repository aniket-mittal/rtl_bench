// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  sirv_gnrl_dffrs dut (
    .clk(clk),
    .dnxt(in_vec[32:1]),
    .rst_n(in_vec[0:0]),
    .qout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h05bcb4b16;
    stim[1] = 33'h0dae2be9e;
    stim[2] = 33'h1de7263ab;
    stim[3] = 33'h0a6f9d83b;
    stim[4] = 33'h1deee09a3;
    stim[5] = 33'h1e51c5fd1;
    stim[6] = 33'h1e44e92bf;
    stim[7] = 33'h0067a93d3;
    stim[8] = 33'h0388fbed1;
    stim[9] = 33'h1a2edb6fd;
    stim[10] = 33'h089cbdb0f;
    stim[11] = 33'h17e1e82f9;
    stim[12] = 33'h1ade2ffbf;
    stim[13] = 33'h15c14adb5;
    stim[14] = 33'h16ab5eb51;
    stim[15] = 33'h13e1420c9;
    stim[16] = 33'h19b098146;
    stim[17] = 33'h0753d427d;
    stim[18] = 33'h1127e8915;
    stim[19] = 33'h00c5e1c9d;
    stim[20] = 33'h0f05ffcf7;
    stim[21] = 33'h15e2c5b07;
    stim[22] = 33'h089f4c669;
    stim[23] = 33'h1a73f8da1;
    stim[24] = 33'h19fc61b8a;
    stim[25] = 33'h1d1cadd41;
    stim[26] = 33'h15d56e20b;
    stim[27] = 33'h123a3e07f;
    stim[28] = 33'h0c5b11d73;
    stim[29] = 33'h19cf91235;
    stim[30] = 33'h02b844155;
    stim[31] = 33'h1205a2a27;
    stim[32] = 33'h0e7a8536d;
    stim[33] = 33'h14c8c2881;
    stim[34] = 33'h18b5f5731;
    stim[35] = 33'h055289ce9;
    stim[36] = 33'h002ea0f39;
    stim[37] = 33'h1038eddbf;
    stim[38] = 33'h13dc077b1;
    stim[39] = 33'h132ab7199;
    stim[40] = 33'h167e59bb1;
    stim[41] = 33'h1660f536f;
    stim[42] = 33'h1e6e3d50a;
    stim[43] = 33'h02922d261;
    stim[44] = 33'h198720ae3;
    stim[45] = 33'h061f23eff;
    stim[46] = 33'h063b4f0bf;
    stim[47] = 33'h1bb7904f9;
    stim[48] = 33'h10bd53905;
    stim[49] = 33'h1f7990273;
    stim[50] = 33'h0560abf87;
    stim[51] = 33'h1edcbf0fb;
    stim[52] = 33'h1163b0ff5;
    stim[53] = 33'h09ff4ae47;
    stim[54] = 33'h1de2179e7;
    stim[55] = 33'h0b4667004;
    stim[56] = 33'h14fe414d9;
    stim[57] = 33'h0dcc5c1f1;
    stim[58] = 33'h0c2c63499;
    stim[59] = 33'h06164206f;
    stim[60] = 33'h14f17b787;
    stim[61] = 33'h029c93df5;
    stim[62] = 33'h137ed4d63;
    stim[63] = 33'h04cbb9629;
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
      expv[0] = 32'hffffffff;
      expv[1] = 32'hffffffff;
      expv[2] = 32'hffffffff;
      expv[3] = 32'hef3931d5;
      expv[4] = 32'h537cec1d;
      expv[5] = 32'hef7704d1;
      expv[6] = 32'hf28e2fe8;
      expv[7] = 32'hf227495f;
      expv[8] = 32'h033d49e9;
      expv[9] = 32'h1c47df68;
      expv[10] = 32'hd176db7e;
      expv[11] = 32'h44e5ed87;
      expv[12] = 32'hbf0f417c;
      expv[13] = 32'hd6f17fdf;
      expv[14] = 32'hae0a56da;
      expv[15] = 32'hb55af5a8;
      expv[16] = 32'hffffffff;
      expv[17] = 32'hffffffff;
      expv[18] = 32'h3a9ea13e;
      expv[19] = 32'h893f448a;
      expv[20] = 32'h062f0e4e;
      expv[21] = 32'h782ffe7b;
      expv[22] = 32'haf162d83;
      expv[23] = 32'h44fa6334;
      expv[24] = 32'hffffffff;
      expv[25] = 32'hffffffff;
      expv[26] = 32'he8e56ea0;
      expv[27] = 32'haeab7105;
      expv[28] = 32'h91d1f03f;
      expv[29] = 32'h62d88eb9;
      expv[30] = 32'hce7c891a;
      expv[31] = 32'h15c220aa;
      expv[32] = 32'h902d1513;
      expv[33] = 32'h73d429b6;
      expv[34] = 32'ha6461440;
      expv[35] = 32'hc5afab98;
      expv[36] = 32'h2a944e74;
      expv[37] = 32'h0175079c;
      expv[38] = 32'h81c76edf;
      expv[39] = 32'h9ee03bd8;
      expv[40] = 32'h9955b8cc;
      expv[41] = 32'hb3f2cdd8;
      expv[42] = 32'hffffffff;
      expv[43] = 32'hffffffff;
      expv[44] = 32'h14916930;
      expv[45] = 32'hcc390571;
      expv[46] = 32'h30f91f7f;
      expv[47] = 32'h31da785f;
      expv[48] = 32'hddbc827c;
      expv[49] = 32'h85ea9c82;
      expv[50] = 32'hfbcc8139;
      expv[51] = 32'h2b055fc3;
      expv[52] = 32'hf6e5f87d;
      expv[53] = 32'h8b1d87fa;
      expv[54] = 32'h4ffa5723;
      expv[55] = 32'hffffffff;
      expv[56] = 32'hffffffff;
      expv[57] = 32'ha7f20a6c;
      expv[58] = 32'h6e62e0f8;
      expv[59] = 32'h61631a4c;
      expv[60] = 32'h30b21037;
      expv[61] = 32'ha78bdbc3;
      expv[62] = 32'h14e49efa;
      expv[63] = 32'h9bf6a6b1;
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
