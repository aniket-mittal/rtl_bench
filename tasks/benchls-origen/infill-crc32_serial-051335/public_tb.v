// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_051335 dut (
    .clk(clk),
    .reset(in_vec[2:2]),
    .enable(in_vec[1:1]),
    .d(in_vec[0:0]),
    .q(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h7;
    stim[1] = 3'h5;
    stim[2] = 3'h1;
    stim[3] = 3'h0;
    stim[4] = 3'h1;
    stim[5] = 3'h2;
    stim[6] = 3'h1;
    stim[7] = 3'h0;
    stim[8] = 3'h1;
    stim[9] = 3'h1;
    stim[10] = 3'h3;
    stim[11] = 3'h3;
    stim[12] = 3'h3;
    stim[13] = 3'h0;
    stim[14] = 3'h3;
    stim[15] = 3'h3;
    stim[16] = 3'h3;
    stim[17] = 3'h0;
    stim[18] = 3'h1;
    stim[19] = 3'h1;
    stim[20] = 3'h2;
    stim[21] = 3'h1;
    stim[22] = 3'h2;
    stim[23] = 3'h3;
    stim[24] = 3'h5;
    stim[25] = 3'h3;
    stim[26] = 3'h1;
    stim[27] = 3'h3;
    stim[28] = 3'h3;
    stim[29] = 3'h2;
    stim[30] = 3'h1;
    stim[31] = 3'h1;
    stim[32] = 3'h0;
    stim[33] = 3'h0;
    stim[34] = 3'h2;
    stim[35] = 3'h2;
    stim[36] = 3'h1;
    stim[37] = 3'h2;
    stim[38] = 3'h0;
    stim[39] = 3'h2;
    stim[40] = 3'h2;
    stim[41] = 3'h2;
    stim[42] = 3'h0;
    stim[43] = 3'h0;
    stim[44] = 3'h0;
    stim[45] = 3'h0;
    stim[46] = 3'h2;
    stim[47] = 3'h0;
    stim[48] = 3'h2;
    stim[49] = 3'h2;
    stim[50] = 3'h2;
    stim[51] = 3'h3;
    stim[52] = 3'h3;
    stim[53] = 3'h1;
    stim[54] = 3'h0;
    stim[55] = 3'h3;
    stim[56] = 3'h3;
    stim[57] = 3'h3;
    stim[58] = 3'h3;
    stim[59] = 3'h3;
    stim[60] = 3'h0;
    stim[61] = 3'h1;
    stim[62] = 3'h3;
    stim[63] = 3'h1;
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
      expv[3] = 32'hffffffff;
      expv[4] = 32'hffffffff;
      expv[5] = 32'hffffffff;
      expv[6] = 32'hfb3ee249;
      expv[7] = 32'hfb3ee249;
      expv[8] = 32'hfb3ee249;
      expv[9] = 32'hfb3ee249;
      expv[10] = 32'hfb3ee249;
      expv[11] = 32'hf67dc492;
      expv[12] = 32'hecfb8924;
      expv[13] = 32'hd9f71248;
      expv[14] = 32'hd9f71248;
      expv[15] = 32'hb3ee2490;
      expv[16] = 32'h67dc4920;
      expv[17] = 32'hcb798ff7;
      expv[18] = 32'hcb798ff7;
      expv[19] = 32'hcb798ff7;
      expv[20] = 32'hcb798ff7;
      expv[21] = 32'h92320259;
      expv[22] = 32'h92320259;
      expv[23] = 32'h20a51905;
      expv[24] = 32'hffffffff;
      expv[25] = 32'hffffffff;
      expv[26] = 32'hfffffffe;
      expv[27] = 32'hfffffffe;
      expv[28] = 32'hfffffffc;
      expv[29] = 32'hfffffff8;
      expv[30] = 32'hfb3ee247;
      expv[31] = 32'hfb3ee247;
      expv[32] = 32'hfb3ee247;
      expv[33] = 32'hfb3ee247;
      expv[34] = 32'hfb3ee247;
      expv[35] = 32'hf2bcd939;
      expv[36] = 32'he1b8afc5;
      expv[37] = 32'he1b8afc5;
      expv[38] = 32'hc7b0423d;
      expv[39] = 32'hc7b0423d;
      expv[40] = 32'h8ba199cd;
      expv[41] = 32'h13822e2d;
      expv[42] = 32'h27045c5a;
      expv[43] = 32'h27045c5a;
      expv[44] = 32'h27045c5a;
      expv[45] = 32'h27045c5a;
      expv[46] = 32'h27045c5a;
      expv[47] = 32'h4e08b8b4;
      expv[48] = 32'h4e08b8b4;
      expv[49] = 32'h9c117168;
      expv[50] = 32'h3ce3ff67;
      expv[51] = 32'h79c7fece;
      expv[52] = 32'hf74ee02b;
      expv[53] = 32'hee9dc056;
      expv[54] = 32'hee9dc056;
      expv[55] = 32'hee9dc056;
      expv[56] = 32'hdd3b80ac;
      expv[57] = 32'hba770158;
      expv[58] = 32'h74ee02b0;
      expv[59] = 32'hed1d18d7;
      expv[60] = 32'hda3a31ae;
      expv[61] = 32'hda3a31ae;
      expv[62] = 32'hda3a31ae;
      expv[63] = 32'hb474635c;
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
