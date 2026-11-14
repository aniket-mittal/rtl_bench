// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .in(in_vec[7:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h7b;
    stim[1] = 8'hea;
    stim[2] = 8'h14;
    stim[3] = 8'ha5;
    stim[4] = 8'h5c;
    stim[5] = 8'hf4;
    stim[6] = 8'ha0;
    stim[7] = 8'h0e;
    stim[8] = 8'h00;
    stim[9] = 8'h62;
    stim[10] = 8'h17;
    stim[11] = 8'hfd;
    stim[12] = 8'h69;
    stim[13] = 8'hd6;
    stim[14] = 8'hf4;
    stim[15] = 8'h3e;
    stim[16] = 8'he1;
    stim[17] = 8'hfc;
    stim[18] = 8'hbb;
    stim[19] = 8'h61;
    stim[20] = 8'h6f;
    stim[21] = 8'had;
    stim[22] = 8'h85;
    stim[23] = 8'h65;
    stim[24] = 8'hfc;
    stim[25] = 8'h6f;
    stim[26] = 8'h2b;
    stim[27] = 8'hfd;
    stim[28] = 8'hbd;
    stim[29] = 8'h83;
    stim[30] = 8'h54;
    stim[31] = 8'hcc;
    stim[32] = 8'h4b;
    stim[33] = 8'h60;
    stim[34] = 8'h21;
    stim[35] = 8'h49;
    stim[36] = 8'hbd;
    stim[37] = 8'hd7;
    stim[38] = 8'hb0;
    stim[39] = 8'h3d;
    stim[40] = 8'h6b;
    stim[41] = 8'h53;
    stim[42] = 8'ha2;
    stim[43] = 8'h9f;
    stim[44] = 8'hea;
    stim[45] = 8'h90;
    stim[46] = 8'h1d;
    stim[47] = 8'hc8;
    stim[48] = 8'hb1;
    stim[49] = 8'he5;
    stim[50] = 8'h7f;
    stim[51] = 8'h79;
    stim[52] = 8'h54;
    stim[53] = 8'ha6;
    stim[54] = 8'h3f;
    stim[55] = 8'hca;
    stim[56] = 8'h50;
    stim[57] = 8'h85;
    stim[58] = 8'h4f;
    stim[59] = 8'h32;
    stim[60] = 8'h37;
    stim[61] = 8'h53;
    stim[62] = 8'h67;
    stim[63] = 8'hcc;
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
      expv[0] = 32'h0000007b;
      expv[1] = 32'hffffffea;
      expv[2] = 32'h00000014;
      expv[3] = 32'hffffffa5;
      expv[4] = 32'h0000005c;
      expv[5] = 32'hfffffff4;
      expv[6] = 32'hffffffa0;
      expv[7] = 32'h0000000e;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000062;
      expv[10] = 32'h00000017;
      expv[11] = 32'hfffffffd;
      expv[12] = 32'h00000069;
      expv[13] = 32'hffffffd6;
      expv[14] = 32'hfffffff4;
      expv[15] = 32'h0000003e;
      expv[16] = 32'hffffffe1;
      expv[17] = 32'hfffffffc;
      expv[18] = 32'hffffffbb;
      expv[19] = 32'h00000061;
      expv[20] = 32'h0000006f;
      expv[21] = 32'hffffffad;
      expv[22] = 32'hffffff85;
      expv[23] = 32'h00000065;
      expv[24] = 32'hfffffffc;
      expv[25] = 32'h0000006f;
      expv[26] = 32'h0000002b;
      expv[27] = 32'hfffffffd;
      expv[28] = 32'hffffffbd;
      expv[29] = 32'hffffff83;
      expv[30] = 32'h00000054;
      expv[31] = 32'hffffffcc;
      expv[32] = 32'h0000004b;
      expv[33] = 32'h00000060;
      expv[34] = 32'h00000021;
      expv[35] = 32'h00000049;
      expv[36] = 32'hffffffbd;
      expv[37] = 32'hffffffd7;
      expv[38] = 32'hffffffb0;
      expv[39] = 32'h0000003d;
      expv[40] = 32'h0000006b;
      expv[41] = 32'h00000053;
      expv[42] = 32'hffffffa2;
      expv[43] = 32'hffffff9f;
      expv[44] = 32'hffffffea;
      expv[45] = 32'hffffff90;
      expv[46] = 32'h0000001d;
      expv[47] = 32'hffffffc8;
      expv[48] = 32'hffffffb1;
      expv[49] = 32'hffffffe5;
      expv[50] = 32'h0000007f;
      expv[51] = 32'h00000079;
      expv[52] = 32'h00000054;
      expv[53] = 32'hffffffa6;
      expv[54] = 32'h0000003f;
      expv[55] = 32'hffffffca;
      expv[56] = 32'h00000050;
      expv[57] = 32'hffffff85;
      expv[58] = 32'h0000004f;
      expv[59] = 32'h00000032;
      expv[60] = 32'h00000037;
      expv[61] = 32'h00000053;
      expv[62] = 32'h00000067;
      expv[63] = 32'hffffffcc;
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
