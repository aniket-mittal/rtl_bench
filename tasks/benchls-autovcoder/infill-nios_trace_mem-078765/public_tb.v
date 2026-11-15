// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 47;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_078765 dut (
    .clk(clk),
    .jrst_n(in_vec[52:52]),
    .trc_ctrl(in_vec[51:36]),
    .tw(in_vec[35:0]),
    .tracemem_on(out_vec[46:46]),
    .tracemem_trcdata(out_vec[45:10]),
    .tracemem_tw(out_vec[9:9]),
    .trc_im_addr(out_vec[8:2]),
    .trc_wrap(out_vec[1:1]),
    .xbrk_wrap_traceoff(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h05ab092eb9608f;
    stim[1] = 53'h0872c35bdb7f2b;
    stim[2] = 53'h1f6ece23b594b2;
    stim[3] = 53'h130030d68b9e25;
    stim[4] = 53'h1a06c118859921;
    stim[5] = 53'h1062799048e9b9;
    stim[6] = 53'h1c98abb392850c;
    stim[7] = 53'h1df6636b6bdb81;
    stim[8] = 53'h18229bd948ced3;
    stim[9] = 53'h1ae984a2997f64;
    stim[10] = 53'h148d93cae6f5af;
    stim[11] = 53'h183d81d30a9b65;
    stim[12] = 53'h13c24cb4cc75f9;
    stim[13] = 53'h158f1edeec3f3d;
    stim[14] = 53'h1da5e1fb170d50;
    stim[15] = 53'h11b13e2a98fa9d;
    stim[16] = 53'h1edd35106ba2a9;
    stim[17] = 53'h1d19cb3138e51e;
    stim[18] = 53'h15006ed23a8a49;
    stim[19] = 53'h13750f9a2f8419;
    stim[20] = 53'h17b3288d915f47;
    stim[21] = 53'h1d7b6af7539376;
    stim[22] = 53'h14f05650bbc22a;
    stim[23] = 53'h1151fa22ede448;
    stim[24] = 53'h1ede28c3cc78b2;
    stim[25] = 53'h1a87484b358a53;
    stim[26] = 53'h1082f1e3a7f795;
    stim[27] = 53'h1c31965917902a;
    stim[28] = 53'h1f48f9a29346ac;
    stim[29] = 53'h1a4b4eee76a89c;
    stim[30] = 53'h1604ace5bdfde8;
    stim[31] = 53'h1601ac6f5055ef;
    stim[32] = 53'h15f9e60f497f15;
    stim[33] = 53'h1b4e416d73c063;
    stim[34] = 53'h1bf7546a5c7862;
    stim[35] = 53'h114d0f97fdb2f2;
    stim[36] = 53'h1f35ea4e967d7c;
    stim[37] = 53'h1e84eaac8af103;
    stim[38] = 53'h15365902891741;
    stim[39] = 53'h1daa4f46a8d6a4;
    stim[40] = 53'h1d065b0e33c41a;
    stim[41] = 53'h1c989d62cdce49;
    stim[42] = 53'h1230fd3f6df48e;
    stim[43] = 53'h1e52726a019821;
    stim[44] = 53'h171f9eabfd5233;
    stim[45] = 53'h0d6485fac8245a;
    stim[46] = 53'h193484ad75283f;
    stim[47] = 53'h130d6007e88954;
    stim[48] = 53'h19c2cf43ca6e38;
    stim[49] = 53'h1db125d2bc6a6f;
    stim[50] = 53'h1c16d399001717;
    stim[51] = 53'h1b12a934735c9c;
    stim[52] = 53'h1a441c71a3a4de;
    stim[53] = 53'h1555c03eb34038;
    stim[54] = 53'h14d12f892f7fe9;
    stim[55] = 53'h1299126451a76f;
    stim[56] = 53'h109f5559fcd7e3;
    stim[57] = 53'h12cf53540a09dc;
    stim[58] = 53'h16286b2ed9a21c;
    stim[59] = 53'h1c65f0e3957dae;
    stim[60] = 53'h165e3c366201f6;
    stim[61] = 53'h1a78e6e344c0cd;
    stim[62] = 53'h1d8cef4d935ee1;
    stim[63] = 53'h1293caaf90aa29;
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
      expv[0] = 47'hx00000000x00;
      expv[1] = 47'hx00000000x00;
      expv[2] = 47'hx00000000x00;
      expv[3] = 47'hx00000000x00;
      expv[4] = 47'hx00000000x00;
      expv[5] = 47'hx00000000x00;
      expv[6] = 47'hx00000000x00;
      expv[7] = 47'hx00000000x00;
      expv[8] = 47'hx00000000x00;
      expv[9] = 47'hx00000000x00;
      expv[10] = 47'hx00000000x00;
      expv[11] = 47'hx00000000x00;
      expv[12] = 47'hx00000000x00;
      expv[13] = 47'hx00000000x00;
      expv[14] = 47'hx00000000x00;
      expv[15] = 47'hx00000000x00;
      expv[16] = 47'hx00000000x00;
      expv[17] = 47'hx00000000x00;
      expv[18] = 47'hx00000000x00;
      expv[19] = 47'hx00000000x00;
      expv[20] = 47'hx00000000x00;
      expv[21] = 47'hx00000000x00;
      expv[22] = 47'hx00000000x00;
      expv[23] = 47'hx00000000x00;
      expv[24] = 47'hx00000000x00;
      expv[25] = 47'hx00000000x00;
      expv[26] = 47'hx00000000x00;
      expv[27] = 47'hx00000000x00;
      expv[28] = 47'hx00000000x00;
      expv[29] = 47'hx00000000x00;
      expv[30] = 47'hx00000000x00;
      expv[31] = 47'hx00000000x00;
      expv[32] = 47'hx00000000x00;
      expv[33] = 47'hx00000000x00;
      expv[34] = 47'hx00000000x00;
      expv[35] = 47'hx00000000x00;
      expv[36] = 47'hx00000000x00;
      expv[37] = 47'hx00000000x00;
      expv[38] = 47'hx00000000x00;
      expv[39] = 47'hx00000000x00;
      expv[40] = 47'hx00000000x00;
      expv[41] = 47'hx00000000x00;
      expv[42] = 47'hx00000000x00;
      expv[43] = 47'hx00000000x00;
      expv[44] = 47'hx00000000x00;
      expv[45] = 47'hx00000000x00;
      expv[46] = 47'hx00000000x00;
      expv[47] = 47'hx00000000x00;
      expv[48] = 47'hx00000000x00;
      expv[49] = 47'hx00000000x00;
      expv[50] = 47'hx00000000x00;
      expv[51] = 47'hx00000000x00;
      expv[52] = 47'hx00000000x00;
      expv[53] = 47'hx00000000x00;
      expv[54] = 47'hx00000000x00;
      expv[55] = 47'hx00000000x00;
      expv[56] = 47'hx00000000x00;
      expv[57] = 47'hx00000000x00;
      expv[58] = 47'hx00000000x00;
      expv[59] = 47'hx00000000x00;
      expv[60] = 47'hx00000000x00;
      expv[61] = 47'hx00000000x00;
      expv[62] = 47'hx00000000x00;
      expv[63] = 47'hx00000000x00;
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
