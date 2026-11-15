// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_124008 dut (
    .clk(clk),
    .rst(in_vec[31:31]),
    .enable(in_vec[30:30]),
    .index(in_vec[29:26]),
    .word(in_vec[25:24]),
    .comp(in_vec[23:23]),
    .write(in_vec[22:22]),
    .tag_in(in_vec[21:17]),
    .data_in(in_vec[16:1]),
    .valid_in(in_vec[0:0]),
    .hit(out_vec[23:23]),
    .dirty(out_vec[22:22]),
    .tag_out(out_vec[21:17]),
    .data_out(out_vec[16:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hca79669d;
    stim[1] = 32'hb6fb88f3;
    stim[2] = 32'h3979cb80;
    stim[3] = 32'h5688f4ab;
    stim[4] = 32'h709210f8;
    stim[5] = 32'h5180f450;
    stim[6] = 32'h31a37c1b;
    stim[7] = 32'h04854faa;
    stim[8] = 32'h709395b5;
    stim[9] = 32'h470b5bb4;
    stim[10] = 32'h7b9aeabc;
    stim[11] = 32'h556e5597;
    stim[12] = 32'h7b0c4700;
    stim[13] = 32'h64ca0e09;
    stim[14] = 32'h513fff23;
    stim[15] = 32'h7238b2ed;
    stim[16] = 32'h20264c37;
    stim[17] = 32'h2dad268f;
    stim[18] = 32'h6053a9d8;
    stim[19] = 32'h14dc35df;
    stim[20] = 32'h03e21620;
    stim[21] = 32'h1e1ee9fd;
    stim[22] = 32'h75f8865b;
    stim[23] = 32'h66a203f3;
    stim[24] = 32'h04c46e46;
    stim[25] = 32'h0cf5e662;
    stim[26] = 32'h2a16cdee;
    stim[27] = 32'h0a3cdf73;
    stim[28] = 32'h14958cc3;
    stim[29] = 32'h764e26cb;
    stim[30] = 32'h2b95cedc;
    stim[31] = 32'h28c74fb4;
    stim[32] = 32'h36b161dc;
    stim[33] = 32'h12855ae1;
    stim[34] = 32'h42190d8e;
    stim[35] = 32'h23024c3e;
    stim[36] = 32'h46311c6f;
    stim[37] = 32'h346c6ba0;
    stim[38] = 32'h10b773b7;
    stim[39] = 32'h407cedb9;
    stim[40] = 32'h57afa752;
    stim[41] = 32'h764dd2e3;
    stim[42] = 32'h2b28cabf;
    stim[43] = 32'h62a96f05;
    stim[44] = 32'h4dc71aca;
    stim[45] = 32'h72465f64;
    stim[46] = 32'h1e2b7416;
    stim[47] = 32'h4d138d7d;
    stim[48] = 32'h116ef902;
    stim[49] = 32'h52743d6c;
    stim[50] = 32'h58f1ff47;
    stim[51] = 32'h0094803d;
    stim[52] = 32'ha61f0cff;
    stim[53] = 32'h5993967a;
    stim[54] = 32'h78dc8f78;
    stim[55] = 32'h477f3cbc;
    stim[56] = 32'h7433d114;
    stim[57] = 32'h78243e72;
    stim[58] = 32'h0f237a23;
    stim[59] = 32'h21602e00;
    stim[60] = 32'h6a201acf;
    stim[61] = 32'h5c909b63;
    stim[62] = 32'h5838846b;
    stim[63] = 32'h44dad733;
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
      expv[0] = 24'h000000;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'h000000;
      expv[4] = 24'h000000;
      expv[5] = 24'h000000;
      expv[6] = 24'h000000;
      expv[7] = 24'h000000;
      expv[8] = 24'h000000;
      expv[9] = 24'h000000;
      expv[10] = 24'h000000;
      expv[11] = 24'h000000;
      expv[12] = 24'h000000;
      expv[13] = 24'h000000;
      expv[14] = 24'h000000;
      expv[15] = 24'h000000;
      expv[16] = 24'h000000;
      expv[17] = 24'h000000;
      expv[18] = 24'h000000;
      expv[19] = 24'h000000;
      expv[20] = 24'h000000;
      expv[21] = 24'h000000;
      expv[22] = 24'h000000;
      expv[23] = 24'h000000;
      expv[24] = 24'h000000;
      expv[25] = 24'h000000;
      expv[26] = 24'h000000;
      expv[27] = 24'h000000;
      expv[28] = 24'h000000;
      expv[29] = 24'h000000;
      expv[30] = 24'h000000;
      expv[31] = 24'h000000;
      expv[32] = 24'h000000;
      expv[33] = 24'h000000;
      expv[34] = 24'h000000;
      expv[35] = 24'h000000;
      expv[36] = 24'h000000;
      expv[37] = 24'h000000;
      expv[38] = 24'h000000;
      expv[39] = 24'h000000;
      expv[40] = 24'h000000;
      expv[41] = 24'h000000;
      expv[42] = 24'h000000;
      expv[43] = 24'h000000;
      expv[44] = 24'h000000;
      expv[45] = 24'h000000;
      expv[46] = 24'h000000;
      expv[47] = 24'h000000;
      expv[48] = 24'h000000;
      expv[49] = 24'h000000;
      expv[50] = 24'h000000;
      expv[51] = 24'h000000;
      expv[52] = 24'h000000;
      expv[53] = 24'h000000;
      expv[54] = 24'h000000;
      expv[55] = 24'h000000;
      expv[56] = 24'h000000;
      expv[57] = 24'h000000;
      expv[58] = 24'h000000;
      expv[59] = 24'h000000;
      expv[60] = 24'h000000;
      expv[61] = 24'h000000;
      expv[62] = 24'h000000;
      expv[63] = 24'h000000;
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
