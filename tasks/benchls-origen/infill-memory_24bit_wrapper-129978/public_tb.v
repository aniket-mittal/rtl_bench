// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_129978 dut (
    .clk(clk),
    .we(in_vec[35:35]),
    .addr(in_vec[34:24]),
    .data(in_vec[23:0]),
    .out(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hefd7e1b09;
    stim[1] = 36'hd472ed4d1;
    stim[2] = 36'h34faf1b41;
    stim[3] = 36'h3e76118d3;
    stim[4] = 36'hae0656feb;
    stim[5] = 36'h3cbf39ed3;
    stim[6] = 36'hcb1c9c70f;
    stim[7] = 36'hb7424c4d9;
    stim[8] = 36'hfdcebe31f;
    stim[9] = 36'h1c300f726;
    stim[10] = 36'h39e49efd4;
    stim[11] = 36'h241181456;
    stim[12] = 36'h0184296fd;
    stim[13] = 36'ha86ae5a09;
    stim[14] = 36'h0edff914a;
    stim[15] = 36'hca928a49c;
    stim[16] = 36'h76c7ab70e;
    stim[17] = 36'hfed090867;
    stim[18] = 36'h561d48233;
    stim[19] = 36'hcf068322f;
    stim[20] = 36'h14a7513a0;
    stim[21] = 36'h54eca5b8a;
    stim[22] = 36'hdc824f68b;
    stim[23] = 36'hda47965ec;
    stim[24] = 36'h02bcde371;
    stim[25] = 36'hb58abd192;
    stim[26] = 36'hb411c2180;
    stim[27] = 36'hdad7fb8aa;
    stim[28] = 36'ha2f68f188;
    stim[29] = 36'hc42560191;
    stim[30] = 36'h8e6fc1f18;
    stim[31] = 36'hf4f0d2f46;
    stim[32] = 36'ha7200f485;
    stim[33] = 36'h969b7dd33;
    stim[34] = 36'h6f18ac19d;
    stim[35] = 36'hae066a903;
    stim[36] = 36'h441a47e47;
    stim[37] = 36'h1b962f930;
    stim[38] = 36'he977fb3f3;
    stim[39] = 36'h3b6d501ba;
    stim[40] = 36'h4992c8d5d;
    stim[41] = 36'h11c883732;
    stim[42] = 36'he93f44970;
    stim[43] = 36'h9bec91599;
    stim[44] = 36'hc7f94fcea;
    stim[45] = 36'h501ba0942;
    stim[46] = 36'h86f9c940b;
    stim[47] = 36'h790105d9b;
    stim[48] = 36'h6fc9d6173;
    stim[49] = 36'he96fb744c;
    stim[50] = 36'h5b1189313;
    stim[51] = 36'h10c37e853;
    stim[52] = 36'hc18a45b89;
    stim[53] = 36'hc037c5840;
    stim[54] = 36'hc113a0d15;
    stim[55] = 36'h5a177e739;
    stim[56] = 36'h2a1491cc3;
    stim[57] = 36'hb2cdd2046;
    stim[58] = 36'hc23f8c46e;
    stim[59] = 36'hb6590748b;
    stim[60] = 36'hb0e4317dc;
    stim[61] = 36'hdaa5710f2;
    stim[62] = 36'hdc3995d1f;
    stim[63] = 36'h99d585c4f;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'hxxxxxx;
      expv[2] = 24'hxxxxxx;
      expv[3] = 24'hxxxxxx;
      expv[4] = 24'hxxxxxx;
      expv[5] = 24'hxxxxxx;
      expv[6] = 24'hxxxxxx;
      expv[7] = 24'hxxxxxx;
      expv[8] = 24'hxxxxxx;
      expv[9] = 24'hxxxxxx;
      expv[10] = 24'hxxxxxx;
      expv[11] = 24'hxxxxxx;
      expv[12] = 24'hxxxxxx;
      expv[13] = 24'hxxxxxx;
      expv[14] = 24'hxxxxxx;
      expv[15] = 24'hxxxxxx;
      expv[16] = 24'hxxxxxx;
      expv[17] = 24'hxxxxxx;
      expv[18] = 24'hxxxxxx;
      expv[19] = 24'hxxxxxx;
      expv[20] = 24'hxxxxxx;
      expv[21] = 24'hxxxxxx;
      expv[22] = 24'hxxxxxx;
      expv[23] = 24'hxxxxxx;
      expv[24] = 24'hxxxxxx;
      expv[25] = 24'hxxxxxx;
      expv[26] = 24'hxxxxxx;
      expv[27] = 24'hxxxxxx;
      expv[28] = 24'hxxxxxx;
      expv[29] = 24'hxxxxxx;
      expv[30] = 24'hxxxxxx;
      expv[31] = 24'hxxxxxx;
      expv[32] = 24'hxxxxxx;
      expv[33] = 24'hxxxxxx;
      expv[34] = 24'hxxxxxx;
      expv[35] = 24'hxxxxxx;
      expv[36] = 24'hxxxxxx;
      expv[37] = 24'h656feb;
      expv[38] = 24'hxxxxxx;
      expv[39] = 24'hxxxxxx;
      expv[40] = 24'hxxxxxx;
      expv[41] = 24'hxxxxxx;
      expv[42] = 24'hxxxxxx;
      expv[43] = 24'hxxxxxx;
      expv[44] = 24'hxxxxxx;
      expv[45] = 24'hxxxxxx;
      expv[46] = 24'hxxxxxx;
      expv[47] = 24'hxxxxxx;
      expv[48] = 24'hxxxxxx;
      expv[49] = 24'hxxxxxx;
      expv[50] = 24'hxxxxxx;
      expv[51] = 24'hxxxxxx;
      expv[52] = 24'hxxxxxx;
      expv[53] = 24'hxxxxxx;
      expv[54] = 24'hxxxxxx;
      expv[55] = 24'hxxxxxx;
      expv[56] = 24'hxxxxxx;
      expv[57] = 24'hxxxxxx;
      expv[58] = 24'hxxxxxx;
      expv[59] = 24'hxxxxxx;
      expv[60] = 24'hxxxxxx;
      expv[61] = 24'hxxxxxx;
      expv[62] = 24'hxxxxxx;
      expv[63] = 24'hxxxxxx;
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
