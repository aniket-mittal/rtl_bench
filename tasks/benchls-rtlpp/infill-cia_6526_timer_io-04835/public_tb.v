// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04835 dut (
    .clk(clk),
    .clk7_en(in_vec[45:45]),
    .clk7n_en(in_vec[44:44]),
    .aen(in_vec[43:43]),
    .rd(in_vec[42:42]),
    .wr(in_vec[41:41]),
    .reset(in_vec[40:40]),
    .rs(in_vec[39:36]),
    .data_in(in_vec[35:28]),
    .tick(in_vec[27:27]),
    .eclk(in_vec[26:26]),
    .porta_in(in_vec[25:20]),
    .portb_in(in_vec[19:12]),
    .kms_level(in_vec[11:11]),
    .kbd_mouse_type(in_vec[10:9]),
    .kbd_mouse_data(in_vec[8:1]),
    .hrtmon_en(in_vec[0:0]),
    .data_out(out_vec[13:6]),
    .irq(out_vec[5:5]),
    .porta_out(out_vec[4:1]),
    .freeze(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h1b5b4943cde0;
    stim[1] = 46'h15c2eab7da96;
    stim[2] = 46'h2050ae12c39d;
    stim[3] = 46'h3c2b9634ef3a;
    stim[4] = 46'h3ca28fc83558;
    stim[5] = 46'h0e004b6718fa;
    stim[6] = 46'h3c90f8268815;
    stim[7] = 46'h32cbbb07fe29;
    stim[8] = 46'h0660f5f2231d;
    stim[9] = 46'h3a2fefa1feb9;
    stim[10] = 46'h2470c33e3a89;
    stim[11] = 46'h32e77bf67c08;
    stim[12] = 46'h3ea2b0515ebd;
    stim[13] = 46'h209e13fe9e1d;
    stim[14] = 46'h32ebcec9b980;
    stim[15] = 46'h3c6f56acf067;
    stim[16] = 46'h22c370ed2645;
    stim[17] = 46'h08b075295656;
    stim[18] = 46'h2079359e0ce4;
    stim[19] = 46'h1b9d66b684cf;
    stim[20] = 46'h088faf06fd8b;
    stim[21] = 46'h24924c6ff302;
    stim[22] = 46'h1e14e5123e22;
    stim[23] = 46'h0e077b4976c0;
    stim[24] = 46'h28436e434bb5;
    stim[25] = 46'h26089c5747eb;
    stim[26] = 46'h2cf90fe511ef;
    stim[27] = 46'h3e8c6a4bd587;
    stim[28] = 46'h3c73246a19bb;
    stim[29] = 46'h14e98c717fd2;
    stim[30] = 46'h15336352368f;
    stim[31] = 46'h38d5383aeec1;
    stim[32] = 46'h0ca059146d8d;
    stim[33] = 46'h30b0cf412d3a;
    stim[34] = 46'h221ac5f3a708;
    stim[35] = 46'h04ad4ad17eed;
    stim[36] = 46'h1c5e0e4f9e63;
    stim[37] = 46'h1432eeaccbd6;
    stim[38] = 46'h2034f40ed06a;
    stim[39] = 46'h1afa548bba19;
    stim[40] = 46'h3c39b10cadf2;
    stim[41] = 46'h3a49291e871c;
    stim[42] = 46'h3cc95849ae01;
    stim[43] = 46'h380c8bafc3ec;
    stim[44] = 46'h0c0a9db388f9;
    stim[45] = 46'h1acf3d945b85;
    stim[46] = 46'h16f4f40c0e87;
    stim[47] = 46'h1edc15e467e3;
    stim[48] = 46'h2aef0961a971;
    stim[49] = 46'h080f0f2fdfca;
    stim[50] = 46'h1abfd4a571d2;
    stim[51] = 46'h3a28fe79ba14;
    stim[52] = 46'h30bb2ada919f;
    stim[53] = 46'h100b34437b47;
    stim[54] = 46'h146929c17e2c;
    stim[55] = 46'h00753df9c126;
    stim[56] = 46'h16998c5a7f55;
    stim[57] = 46'h2e71d4c94464;
    stim[58] = 46'h30c415bc3c84;
    stim[59] = 46'h128dd9b3d249;
    stim[60] = 46'h04b7f0f9b1d7;
    stim[61] = 46'h02d8418236b8;
    stim[62] = 46'h1cfad82bb0b1;
    stim[63] = 46'h0bf269ea8d2c;
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
      expv[0] = 14'hxxxx;
      expv[1] = 14'hxxxx;
      expv[2] = 14'hxxxx;
      expv[3] = 14'hxxxx;
      expv[4] = 14'hxxxx;
      expv[5] = 14'hxxxx;
      expv[6] = 14'hxxxx;
      expv[7] = 14'hxxxx;
      expv[8] = 14'hxxxx;
      expv[9] = 14'hxxxx;
      expv[10] = 14'hxxxx;
      expv[11] = 14'hxxxx;
      expv[12] = 14'hxxxx;
      expv[13] = 14'hxxxx;
      expv[14] = 14'hxxxx;
      expv[15] = 14'hxxxx;
      expv[16] = 14'hxxxx;
      expv[17] = 14'hxxxx;
      expv[18] = 14'hxxxx;
      expv[19] = 14'hxxxx;
      expv[20] = 14'hxxxx;
      expv[21] = 14'hxxxx;
      expv[22] = 14'hxxxx;
      expv[23] = 14'hxxxx;
      expv[24] = 14'hxxxx;
      expv[25] = 14'hxxxx;
      expv[26] = 14'hxxxx;
      expv[27] = 14'hxxxx;
      expv[28] = 14'hxxxx;
      expv[29] = 14'hxxxx;
      expv[30] = 14'hxxxx;
      expv[31] = 14'hxxxx;
      expv[32] = 14'hxxxx;
      expv[33] = 14'hxxxx;
      expv[34] = 14'hxxxx;
      expv[35] = 14'hxxxx;
      expv[36] = 14'hxxxx;
      expv[37] = 14'hxxxx;
      expv[38] = 14'hxxxx;
      expv[39] = 14'hxxxx;
      expv[40] = 14'hxxxx;
      expv[41] = 14'hxxxx;
      expv[42] = 14'hxxxx;
      expv[43] = 14'hxxxx;
      expv[44] = 14'h3xxx;
      expv[45] = 14'hxxxx;
      expv[46] = 14'hxxxx;
      expv[47] = 14'hxxxx;
      expv[48] = 14'hxxxx;
      expv[49] = 14'hxxxx;
      expv[50] = 14'hxxxx;
      expv[51] = 14'hxxxx;
      expv[52] = 14'hxxxx;
      expv[53] = 14'hxxxx;
      expv[54] = 14'hxxxx;
      expv[55] = 14'hxxxx;
      expv[56] = 14'hxxxx;
      expv[57] = 14'hxxxx;
      expv[58] = 14'hxxxx;
      expv[59] = 14'hxxxx;
      expv[60] = 14'hxxxx;
      expv[61] = 14'hxxxx;
      expv[62] = 14'hxxxx;
      expv[63] = 14'hxxxx;
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
