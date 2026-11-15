// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03142 dut (
    .clk(clk),
    .rin(in_vec[11:11]),
    .clr(in_vec[10:10]),
    .ena(in_vec[9:9]),
    .padder(in_vec[8:2]),
    .devpor(in_vec[1:1]),
    .devclrn(in_vec[0:0]),
    .ctrlout(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hc20;
    stim[1] = 12'h58c;
    stim[2] = 12'h88e;
    stim[3] = 12'h3b1;
    stim[4] = 12'h1f6;
    stim[5] = 12'h95e;
    stim[6] = 12'h271;
    stim[7] = 12'h8a8;
    stim[8] = 12'h171;
    stim[9] = 12'h9bd;
    stim[10] = 12'h991;
    stim[11] = 12'h91c;
    stim[12] = 12'hbc1;
    stim[13] = 12'h30f;
    stim[14] = 12'h057;
    stim[15] = 12'h889;
    stim[16] = 12'h884;
    stim[17] = 12'h15a;
    stim[18] = 12'h276;
    stim[19] = 12'h9b4;
    stim[20] = 12'hb73;
    stim[21] = 12'h36a;
    stim[22] = 12'ha1f;
    stim[23] = 12'h820;
    stim[24] = 12'h2d7;
    stim[25] = 12'hafa;
    stim[26] = 12'h801;
    stim[27] = 12'h275;
    stim[28] = 12'h34a;
    stim[29] = 12'ha25;
    stim[30] = 12'ha21;
    stim[31] = 12'hb50;
    stim[32] = 12'h104;
    stim[33] = 12'h0cd;
    stim[34] = 12'had5;
    stim[35] = 12'h11d;
    stim[36] = 12'h826;
    stim[37] = 12'h188;
    stim[38] = 12'ha15;
    stim[39] = 12'ha93;
    stim[40] = 12'h9b1;
    stim[41] = 12'h294;
    stim[42] = 12'h23a;
    stim[43] = 12'ha67;
    stim[44] = 12'h30e;
    stim[45] = 12'h9e4;
    stim[46] = 12'h003;
    stim[47] = 12'ha8f;
    stim[48] = 12'h1cf;
    stim[49] = 12'hc04;
    stim[50] = 12'had8;
    stim[51] = 12'h81b;
    stim[52] = 12'h340;
    stim[53] = 12'h314;
    stim[54] = 12'h789;
    stim[55] = 12'h0d0;
    stim[56] = 12'hb7b;
    stim[57] = 12'hb19;
    stim[58] = 12'h1bc;
    stim[59] = 12'h3b2;
    stim[60] = 12'h8ab;
    stim[61] = 12'h322;
    stim[62] = 12'h3e7;
    stim[63] = 12'h0e1;
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
      expv[0] = 7'h20;
      expv[1] = 7'h20;
      expv[2] = 7'h20;
      expv[3] = 7'h20;
      expv[4] = 7'h41;
      expv[5] = 7'h41;
      expv[6] = 7'h41;
      expv[7] = 7'h42;
      expv[8] = 7'h42;
      expv[9] = 7'h42;
      expv[10] = 7'h42;
      expv[11] = 7'h42;
      expv[12] = 7'h42;
      expv[13] = 7'h42;
      expv[14] = 7'h42;
      expv[15] = 7'h42;
      expv[16] = 7'h42;
      expv[17] = 7'h42;
      expv[18] = 7'h42;
      expv[19] = 7'h42;
      expv[20] = 7'h42;
      expv[21] = 7'h44;
      expv[22] = 7'h44;
      expv[23] = 7'h44;
      expv[24] = 7'h44;
      expv[25] = 7'h44;
      expv[26] = 7'h44;
      expv[27] = 7'h44;
      expv[28] = 7'h44;
      expv[29] = 7'h44;
      expv[30] = 7'h44;
      expv[31] = 7'h44;
      expv[32] = 7'h44;
      expv[33] = 7'h44;
      expv[34] = 7'h44;
      expv[35] = 7'h44;
      expv[36] = 7'h44;
      expv[37] = 7'h44;
      expv[38] = 7'h44;
      expv[39] = 7'h44;
      expv[40] = 7'h44;
      expv[41] = 7'h44;
      expv[42] = 7'h44;
      expv[43] = 7'h44;
      expv[44] = 7'h44;
      expv[45] = 7'h44;
      expv[46] = 7'h44;
      expv[47] = 7'h44;
      expv[48] = 7'h44;
      expv[49] = 7'h20;
      expv[50] = 7'h20;
      expv[51] = 7'h20;
      expv[52] = 7'h20;
      expv[53] = 7'h20;
      expv[54] = 7'h20;
      expv[55] = 7'h20;
      expv[56] = 7'h20;
      expv[57] = 7'h20;
      expv[58] = 7'h40;
      expv[59] = 7'h40;
      expv[60] = 7'h40;
      expv[61] = 7'h40;
      expv[62] = 7'h40;
      expv[63] = 7'h40;
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
