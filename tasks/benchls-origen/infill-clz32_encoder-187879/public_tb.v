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

  origen_187879 dut (
    .in(in_vec[31:0]),
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
    stim[0] = 32'hb42d81c2;
    stim[1] = 32'h87cbd42c;
    stim[2] = 32'h10af4e59;
    stim[3] = 32'had46b55e;
    stim[4] = 32'h917e232f;
    stim[5] = 32'hd3b1ed88;
    stim[6] = 32'h237d0b45;
    stim[7] = 32'he4bc49ba;
    stim[8] = 32'h462d95b6;
    stim[9] = 32'h09e4e6e3;
    stim[10] = 32'h62202f9a;
    stim[11] = 32'h4d2c766a;
    stim[12] = 32'h9277ba24;
    stim[13] = 32'h16fe783e;
    stim[14] = 32'hfafe4998;
    stim[15] = 32'h1892bc51;
    stim[16] = 32'h80e6cf7a;
    stim[17] = 32'h51fa80ad;
    stim[18] = 32'h6c1b9ce1;
    stim[19] = 32'h5bcf8f51;
    stim[20] = 32'h1d6c754e;
    stim[21] = 32'h2c527e5a;
    stim[22] = 32'h364a12c8;
    stim[23] = 32'h2f1c0d6b;
    stim[24] = 32'h2f0465bb;
    stim[25] = 32'hcc1fcc78;
    stim[26] = 32'h927db880;
    stim[27] = 32'h4ef885fa;
    stim[28] = 32'hc31f6f50;
    stim[29] = 32'h98a61b7a;
    stim[30] = 32'h395bfdd6;
    stim[31] = 32'h8f0cfa0e;
    stim[32] = 32'hbde5deff;
    stim[33] = 32'h58f7d9fb;
    stim[34] = 32'h70806aa5;
    stim[35] = 32'h7ed94f43;
    stim[36] = 32'h018aef9d;
    stim[37] = 32'h9bd41195;
    stim[38] = 32'ha2161569;
    stim[39] = 32'h0d1fe2dd;
    stim[40] = 32'hd1e7e633;
    stim[41] = 32'h68981009;
    stim[42] = 32'hbd1a8663;
    stim[43] = 32'h699694e4;
    stim[44] = 32'heae9460f;
    stim[45] = 32'ha6e5fe31;
    stim[46] = 32'h6ef62601;
    stim[47] = 32'h7796475b;
    stim[48] = 32'h38cc763e;
    stim[49] = 32'h0b4c3374;
    stim[50] = 32'h1bc66d00;
    stim[51] = 32'h56d5b856;
    stim[52] = 32'hf78f8ffc;
    stim[53] = 32'h62fa9550;
    stim[54] = 32'h51d92896;
    stim[55] = 32'h9d4ce2e7;
    stim[56] = 32'hab96367b;
    stim[57] = 32'hdf3ff12e;
    stim[58] = 32'h745c48ac;
    stim[59] = 32'hf3af6c01;
    stim[60] = 32'h09739159;
    stim[61] = 32'h1f337d8b;
    stim[62] = 32'h0ad4dc6c;
    stim[63] = 32'hd427dce2;
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
      expv[2] = 32'h00000003;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000002;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000001;
      expv[9] = 32'h00000004;
      expv[10] = 32'h00000001;
      expv[11] = 32'h00000001;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000003;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000003;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000001;
      expv[18] = 32'h00000001;
      expv[19] = 32'h00000001;
      expv[20] = 32'h00000003;
      expv[21] = 32'h00000002;
      expv[22] = 32'h00000002;
      expv[23] = 32'h00000002;
      expv[24] = 32'h00000002;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000001;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000002;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000001;
      expv[34] = 32'h00000001;
      expv[35] = 32'h00000001;
      expv[36] = 32'h00000007;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000004;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000001;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000001;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000001;
      expv[47] = 32'h00000001;
      expv[48] = 32'h00000002;
      expv[49] = 32'h00000004;
      expv[50] = 32'h00000003;
      expv[51] = 32'h00000001;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000001;
      expv[54] = 32'h00000001;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000001;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000004;
      expv[61] = 32'h00000003;
      expv[62] = 32'h00000004;
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
