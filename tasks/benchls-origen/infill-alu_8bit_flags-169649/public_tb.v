// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_169649 dut (
    .A(in_vec[19:12]),
    .B(in_vec[11:4]),
    .opcode(in_vec[3:0]),
    .Y(out_vec[11:4]),
    .N(out_vec[3:3]),
    .Z(out_vec[2:2]),
    .C(out_vec[1:1]),
    .V(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h1f731;
    stim[1] = 20'hbb7be;
    stim[2] = 20'hdb00f;
    stim[3] = 20'h15c80;
    stim[4] = 20'hf1a8d;
    stim[5] = 20'h8a9be;
    stim[6] = 20'hd34b4;
    stim[7] = 20'h37b6c;
    stim[8] = 20'h530ab;
    stim[9] = 20'h37336;
    stim[10] = 20'h4c67d;
    stim[11] = 20'h2edce;
    stim[12] = 20'h9de08;
    stim[13] = 20'h228dd;
    stim[14] = 20'h41c0f;
    stim[15] = 20'h88b5e;
    stim[16] = 20'h89a44;
    stim[17] = 20'h2db0a;
    stim[18] = 20'h78f49;
    stim[19] = 20'h70cf0;
    stim[20] = 20'he0d6d;
    stim[21] = 20'h75c0e;
    stim[22] = 20'h860b4;
    stim[23] = 20'h963dd;
    stim[24] = 20'h9df24;
    stim[25] = 20'h522b0;
    stim[26] = 20'h91b9c;
    stim[27] = 20'h7a95c;
    stim[28] = 20'h37424;
    stim[29] = 20'h5ec6f;
    stim[30] = 20'h2ea48;
    stim[31] = 20'h8f0f3;
    stim[32] = 20'h8101c;
    stim[33] = 20'h8ceda;
    stim[34] = 20'h69e0d;
    stim[35] = 20'hc79aa;
    stim[36] = 20'h024f7;
    stim[37] = 20'hc2b0a;
    stim[38] = 20'hb679c;
    stim[39] = 20'he72d4;
    stim[40] = 20'h97464;
    stim[41] = 20'h87b8e;
    stim[42] = 20'h8a561;
    stim[43] = 20'hfe3c2;
    stim[44] = 20'h988e4;
    stim[45] = 20'h89c42;
    stim[46] = 20'ha0ce6;
    stim[47] = 20'hd5dfd;
    stim[48] = 20'h92d67;
    stim[49] = 20'h38828;
    stim[50] = 20'hc38da;
    stim[51] = 20'h57857;
    stim[52] = 20'h35917;
    stim[53] = 20'h88fe7;
    stim[54] = 20'hd1943;
    stim[55] = 20'h04004;
    stim[56] = 20'h952ba;
    stim[57] = 20'hcc843;
    stim[58] = 20'hf28db;
    stim[59] = 20'h01d79;
    stim[60] = 20'h3899e;
    stim[61] = 20'hd561c;
    stim[62] = 20'h8d5f3;
    stim[63] = 20'hd074b;
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
      expv[0] = 12'h130;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h988;
      expv[7] = 12'h000;
      expv[8] = 12'h000;
      expv[9] = 12'h060;
      expv[10] = 12'h000;
      expv[11] = 12'h000;
      expv[12] = 12'h7d3;
      expv[13] = 12'h000;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h2d0;
      expv[17] = 12'h000;
      expv[18] = 12'h84b;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h8d8;
      expv[23] = 12'h000;
      expv[24] = 12'h6f0;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h750;
      expv[29] = 12'h000;
      expv[30] = 12'hd28;
      expv[31] = 12'h700;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h004;
      expv[37] = 12'h000;
      expv[38] = 12'h000;
      expv[39] = 12'hca8;
      expv[40] = 12'hd18;
      expv[41] = 12'h000;
      expv[42] = 12'h020;
      expv[43] = 12'hfe8;
      expv[44] = 12'h160;
      expv[45] = 12'hcd8;
      expv[46] = 12'hfe8;
      expv[47] = 12'h000;
      expv[48] = 12'h020;
      expv[49] = 12'hba8;
      expv[50] = 12'h000;
      expv[51] = 12'h020;
      expv[52] = 12'h1a0;
      expv[53] = 12'h020;
      expv[54] = 12'h2e0;
      expv[55] = 12'h040;
      expv[56] = 12'h000;
      expv[57] = 12'h330;
      expv[58] = 12'h000;
      expv[59] = 12'h2a2;
      expv[60] = 12'h000;
      expv[61] = 12'h000;
      expv[62] = 12'h720;
      expv[63] = 12'h000;
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
