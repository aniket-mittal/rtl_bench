// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_122538 dut (
    .clk(clk),
    .rst(in_vec[22:22]),
    .recv_reset(in_vec[21:21]),
    .recv_data(in_vec[20:13]),
    .recv_ok(in_vec[12:12]),
    .trans_reset(in_vec[11:11]),
    .trans_busy(in_vec[10:10]),
    .uart_in_data(in_vec[9:2]),
    .uart_in_valid(in_vec[1:1]),
    .uart_out_ready(in_vec[0:0]),
    .lost(out_vec[29:29]),
    .trans_data(out_vec[28:21]),
    .trans_ok(out_vec[20:20]),
    .uart_in_ready(out_vec[19:19]),
    .uart_out_data(out_vec[18:11]),
    .uart_out_valid(out_vec[10:10]),
    .recv_buffer_length(out_vec[9:5]),
    .trans_buffer_length(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h49d836;
    stim[1] = 23'h624079;
    stim[2] = 23'h20a2de;
    stim[3] = 23'h3637f1;
    stim[4] = 23'h3c21f8;
    stim[5] = 23'h0534b1;
    stim[6] = 23'h3c5287;
    stim[7] = 23'h2f7ae9;
    stim[8] = 23'h2fd638;
    stim[9] = 23'h28647c;
    stim[10] = 23'h0b3b4d;
    stim[11] = 23'h0fcd03;
    stim[12] = 23'h3afa3f;
    stim[13] = 23'h108f43;
    stim[14] = 23'h1a9ac9;
    stim[15] = 23'h056c70;
    stim[16] = 23'h11b168;
    stim[17] = 23'h075ec0;
    stim[18] = 23'h2191f9;
    stim[19] = 23'h0f9331;
    stim[20] = 23'h25fc13;
    stim[21] = 23'h16470f;
    stim[22] = 23'h3d806f;
    stim[23] = 23'h0e0ac6;
    stim[24] = 23'h269449;
    stim[25] = 23'h3597bb;
    stim[26] = 23'h0ccf9b;
    stim[27] = 23'h02b3ab;
    stim[28] = 23'h2aff94;
    stim[29] = 23'h0fa268;
    stim[30] = 23'h104411;
    stim[31] = 23'h1e2417;
    stim[32] = 23'h01768b;
    stim[33] = 23'h027b0d;
    stim[34] = 23'h2233dd;
    stim[35] = 23'h0690d1;
    stim[36] = 23'h17121e;
    stim[37] = 23'h1bf61f;
    stim[38] = 23'h28c5dc;
    stim[39] = 23'h3ea985;
    stim[40] = 23'h0d5c2a;
    stim[41] = 23'h3601c6;
    stim[42] = 23'h111e31;
    stim[43] = 23'h342936;
    stim[44] = 23'h2f18ed;
    stim[45] = 23'h309b1d;
    stim[46] = 23'h3f0ecc;
    stim[47] = 23'h3f1ab0;
    stim[48] = 23'h1faa2d;
    stim[49] = 23'h22158e;
    stim[50] = 23'h3daeb2;
    stim[51] = 23'h1a7118;
    stim[52] = 23'h06855d;
    stim[53] = 23'h3fc9c5;
    stim[54] = 23'h18ea3d;
    stim[55] = 23'h108f8a;
    stim[56] = 23'h18cfe1;
    stim[57] = 23'h38a47b;
    stim[58] = 23'h0d046c;
    stim[59] = 23'h23d16d;
    stim[60] = 23'h0307e6;
    stim[61] = 23'h12d52d;
    stim[62] = 23'h02af41;
    stim[63] = 23'h30ff50;
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
      expv[0] = 30'hxxxxxx00;
      expv[1] = 30'hxxxxxx00;
      expv[2] = 30'hxxxxxx00;
      expv[3] = 30'hxxxxxx01;
      expv[4] = 30'hxxxxxx01;
      expv[5] = 30'h16fxxx00;
      expv[6] = 30'h16e94c20;
      expv[7] = 30'h16e94801;
      expv[8] = 30'h16e94800;
      expv[9] = 30'h16e94800;
      expv[10] = 30'h16e94800;
      expv[11] = 30'h16eacc20;
      expv[12] = 30'h16exxx00;
      expv[13] = 30'h16eac800;
      expv[14] = 30'h16eac800;
      expv[15] = 30'h16eea420;
      expv[16] = 30'h16eea420;
      expv[17] = 30'h16eea440;
      expv[18] = 30'h16eea460;
      expv[19] = 30'h16eea000;
      expv[20] = 30'h16ebe420;
      expv[21] = 30'h16ebe000;
      expv[22] = 30'h16ebe001;
      expv[23] = 30'h187be000;
      expv[24] = 30'h186be000;
      expv[25] = 30'h186be000;
      expv[26] = 30'h186be001;
      expv[27] = 30'h186be000;
      expv[28] = 30'h1868ac21;
      expv[29] = 30'h1868a800;
      expv[30] = 30'h1868a800;
      expv[31] = 30'h1868a800;
      expv[32] = 30'h1868a801;
      expv[33] = 30'h18685c22;
      expv[34] = 30'h18689c00;
      expv[35] = 30'h18685800;
      expv[36] = 30'h1869a420;
      expv[37] = 30'h1869a441;
      expv[38] = 30'h186dc422;
      expv[39] = 30'h1869a002;
      expv[40] = 30'h1869a000;
      expv[41] = 30'h186b5420;
      expv[42] = 30'h186b5001;
      expv[43] = 30'h186c4420;
      expv[44] = 30'h186c4000;
      expv[45] = 30'h186c4000;
      expv[46] = 30'h186c4000;
      expv[47] = 30'h186c4000;
      expv[48] = 30'h186c4000;
      expv[49] = 30'h186c4000;
      expv[50] = 30'h186c4001;
      expv[51] = 30'h186c4000;
      expv[52] = 30'h186e9c20;
      expv[53] = 30'h186dc000;
      expv[54] = 30'h186e9800;
      expv[55] = 30'h186e9800;
      expv[56] = 30'h186e9800;
      expv[57] = 30'h186e9800;
      expv[58] = 30'h186e9801;
      expv[59] = 30'h186e9801;
      expv[60] = 30'h03de9800;
      expv[61] = 30'h03ce9801;
      expv[62] = 30'h03ccb421;
      expv[63] = 30'h03cdc000;
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
