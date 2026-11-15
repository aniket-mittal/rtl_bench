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

  origen_114673 dut (
    .X(in_vec[31:0]),
    .SIN(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h7013065b;
    stim[1] = 32'ha8a3a4f0;
    stim[2] = 32'ha42cf54e;
    stim[3] = 32'h7cb6b163;
    stim[4] = 32'h09468f75;
    stim[5] = 32'h41d72ac7;
    stim[6] = 32'hd9ef2707;
    stim[7] = 32'he97b73ea;
    stim[8] = 32'h9dd7ae22;
    stim[9] = 32'h86c17f07;
    stim[10] = 32'h439e026a;
    stim[11] = 32'hfdfa28e6;
    stim[12] = 32'h3d5f7ad7;
    stim[13] = 32'hc6237766;
    stim[14] = 32'hed28000d;
    stim[15] = 32'h043e412f;
    stim[16] = 32'h6241575b;
    stim[17] = 32'h0d560ad9;
    stim[18] = 32'h90fc6314;
    stim[19] = 32'h7e2de2be;
    stim[20] = 32'h4c06d57a;
    stim[21] = 32'h2cd4886f;
    stim[22] = 32'h6d9bd072;
    stim[23] = 32'hb8a41fb1;
    stim[24] = 32'h0c5cc64e;
    stim[25] = 32'h3f85119a;
    stim[26] = 32'h8bfae585;
    stim[27] = 32'hdefc5a8e;
    stim[28] = 32'h452566ad;
    stim[29] = 32'h36ce008e;
    stim[30] = 32'hfb30981d;
    stim[31] = 32'h702a528a;
    stim[32] = 32'h8c7c589a;
    stim[33] = 32'h3d69f2d6;
    stim[34] = 32'ha377ee0c;
    stim[35] = 32'h76274e80;
    stim[36] = 32'hff36957a;
    stim[37] = 32'hb47a02f6;
    stim[38] = 32'h9864b484;
    stim[39] = 32'hc77b4d3a;
    stim[40] = 32'hf39e3fce;
    stim[41] = 32'hf7389b04;
    stim[42] = 32'hf712f46d;
    stim[43] = 32'h114dd9b8;
    stim[44] = 32'h5bf841af;
    stim[45] = 32'hf7d23594;
    stim[46] = 32'hd84ce471;
    stim[47] = 32'h95eb354a;
    stim[48] = 32'h8c319989;
    stim[49] = 32'hf3997b82;
    stim[50] = 32'hcc9f47c7;
    stim[51] = 32'h4e478712;
    stim[52] = 32'h8d49dc27;
    stim[53] = 32'h7e2abbdd;
    stim[54] = 32'hcd9c143d;
    stim[55] = 32'h42c8d21a;
    stim[56] = 32'h3f7e8309;
    stim[57] = 32'hb7a346ee;
    stim[58] = 32'h9777fb71;
    stim[59] = 32'he49c18e8;
    stim[60] = 32'hea52385b;
    stim[61] = 32'hd1b98c7c;
    stim[62] = 32'h78e0c448;
    stim[63] = 32'hc2faed91;
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
      expv[1] = 32'ha4e331c0;
      expv[2] = 32'ha4e331c0;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000006;
      expv[7] = 32'ha4e331c1;
      expv[8] = 32'ha4e331c0;
      expv[9] = 32'h00000005;
      expv[10] = 32'h00000000;
      expv[11] = 32'ha4e331c0;
      expv[12] = 32'h00000000;
      expv[13] = 32'ha4e331c1;
      expv[14] = 32'hffffffff;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'ha4e331c0;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'ha4e331c0;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'ha4e331c0;
      expv[27] = 32'ha4e331c0;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h0000000a;
      expv[31] = 32'h00000000;
      expv[32] = 32'ha4e331c1;
      expv[33] = 32'h00000000;
      expv[34] = 32'ha4e331c0;
      expv[35] = 32'h00000000;
      expv[36] = 32'ha4e331c0;
      expv[37] = 32'ha4e331c0;
      expv[38] = 32'ha4e331c0;
      expv[39] = 32'hffffffff;
      expv[40] = 32'ha4e331c1;
      expv[41] = 32'ha4e331c0;
      expv[42] = 32'hffffffff;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'ha4e331c0;
      expv[46] = 32'h77777777;
      expv[47] = 32'ha4e331c0;
      expv[48] = 32'ha4e331c0;
      expv[49] = 32'ha4e331c0;
      expv[50] = 32'ha4e331c0;
      expv[51] = 32'h00000000;
      expv[52] = 32'ha4e331c0;
      expv[53] = 32'h00000000;
      expv[54] = 32'ha4e331c0;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'ha4e331c0;
      expv[58] = 32'h0000000b;
      expv[59] = 32'h00000009;
      expv[60] = 32'ha4e331c0;
      expv[61] = 32'ha4e331c0;
      expv[62] = 32'h00000000;
      expv[63] = 32'ha4e331c0;
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
