// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05399 dut (
    .clk(clk),
    .address(in_vec[22:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h0c36cf;
    stim[1] = 23'h489ca0;
    stim[2] = 23'h4a3a7b;
    stim[3] = 23'h0316ae;
    stim[4] = 23'h578fb8;
    stim[5] = 23'h5af37a;
    stim[6] = 23'h7ff0be;
    stim[7] = 23'h1f76e1;
    stim[8] = 23'h132d68;
    stim[9] = 23'h5e763c;
    stim[10] = 23'h4f9e0c;
    stim[11] = 23'h0fc7ab;
    stim[12] = 23'h27a654;
    stim[13] = 23'h6b2e2b;
    stim[14] = 23'h0755e3;
    stim[15] = 23'h1eb026;
    stim[16] = 23'h7bf63d;
    stim[17] = 23'h5f7427;
    stim[18] = 23'h033688;
    stim[19] = 23'h277f18;
    stim[20] = 23'h03d4f1;
    stim[21] = 23'h534823;
    stim[22] = 23'h3e314d;
    stim[23] = 23'h1ee2c5;
    stim[24] = 23'h5a5055;
    stim[25] = 23'h1efc68;
    stim[26] = 23'h500c69;
    stim[27] = 23'h57655a;
    stim[28] = 23'h28f5c2;
    stim[29] = 23'h4e34d9;
    stim[30] = 23'h7efa1c;
    stim[31] = 23'h27795e;
    stim[32] = 23'h3f2262;
    stim[33] = 23'h5feff3;
    stim[34] = 23'h53d93e;
    stim[35] = 23'h67d544;
    stim[36] = 23'h3bccd6;
    stim[37] = 23'h2f157b;
    stim[38] = 23'h6ab42f;
    stim[39] = 23'h4ad2f7;
    stim[40] = 23'h5e6d10;
    stim[41] = 23'h020d70;
    stim[42] = 23'h16db37;
    stim[43] = 23'h6e8c5c;
    stim[44] = 23'h43b1c7;
    stim[45] = 23'h467bf2;
    stim[46] = 23'h0edff1;
    stim[47] = 23'h43e346;
    stim[48] = 23'h6749dc;
    stim[49] = 23'h03843e;
    stim[50] = 23'h0f49f3;
    stim[51] = 23'h14cecc;
    stim[52] = 23'h1e939e;
    stim[53] = 23'h3b418e;
    stim[54] = 23'h02c57b;
    stim[55] = 23'h779a31;
    stim[56] = 23'h5f5f4b;
    stim[57] = 23'h33c6dc;
    stim[58] = 23'h1a80e5;
    stim[59] = 23'h330cab;
    stim[60] = 23'h4a1843;
    stim[61] = 23'h6aa156;
    stim[62] = 23'h7e02a8;
    stim[63] = 23'h5ae3f2;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h0c34f;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h0b026;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h0c34f;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h0939e;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
