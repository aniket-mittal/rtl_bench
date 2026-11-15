// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02562 dut (
    .clk(clk),
    .reset(in_vec[30:30]),
    .enable(in_vec[29:29]),
    .joint_mode(in_vec[28:28]),
    .page_cross(in_vec[27:27]),
    .joint_req(in_vec[26:26]),
    .prio_top(in_vec[25:25]),
    .prio_high(in_vec[24:24]),
    .prio_top_num(in_vec[23:21]),
    .prio_high_num(in_vec[20:18]),
    .hold(in_vec[17:17]),
    .ch_ready(in_vec[16:9]),
    .ch_active(in_vec[8:1]),
    .finish(in_vec[0:0]),
    .ch_go_out(out_vec[4:4]),
    .ch_num(out_vec[3:1]),
    .ch_last(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h5ea9cb3b;
    stim[1] = 31'h610b92ae;
    stim[2] = 31'h176c37b6;
    stim[3] = 31'h0323b84a;
    stim[4] = 31'h1ee11a3f;
    stim[5] = 31'h347d3f23;
    stim[6] = 31'h3824fd45;
    stim[7] = 31'h0fdbeb06;
    stim[8] = 31'h0650a62b;
    stim[9] = 31'h113b6c61;
    stim[10] = 31'h16bb4200;
    stim[11] = 31'h2c37924d;
    stim[12] = 31'h329db3bb;
    stim[13] = 31'h084e6937;
    stim[14] = 31'h2c28b058;
    stim[15] = 31'h21643228;
    stim[16] = 31'h340f1bb0;
    stim[17] = 31'h27a9b1b6;
    stim[18] = 31'h24b3e9f5;
    stim[19] = 31'h3c67844c;
    stim[20] = 31'h02fbb33b;
    stim[21] = 31'h355bcf3b;
    stim[22] = 31'h3a186074;
    stim[23] = 31'h23214b31;
    stim[24] = 31'h282fce6b;
    stim[25] = 31'h1e53c438;
    stim[26] = 31'h2dcf93b7;
    stim[27] = 31'h175bcd8c;
    stim[28] = 31'h2afebe5b;
    stim[29] = 31'h2d69a48d;
    stim[30] = 31'h378d3fc7;
    stim[31] = 31'h283801ee;
    stim[32] = 31'h2585d487;
    stim[33] = 31'h18dec0b1;
    stim[34] = 31'h1c18f7f2;
    stim[35] = 31'h39cc7065;
    stim[36] = 31'h1f2be716;
    stim[37] = 31'h2a8765ac;
    stim[38] = 31'h06d45c2c;
    stim[39] = 31'h2c973ebc;
    stim[40] = 31'h004c3ca8;
    stim[41] = 31'h33c409df;
    stim[42] = 31'h0619ae22;
    stim[43] = 31'h2f3be571;
    stim[44] = 31'h04949fb9;
    stim[45] = 31'h5711cf82;
    stim[46] = 31'h3c873f24;
    stim[47] = 31'h008b38d7;
    stim[48] = 31'h1218289d;
    stim[49] = 31'h1d3939c2;
    stim[50] = 31'h2ae83398;
    stim[51] = 31'h2de801e4;
    stim[52] = 31'h330f67c7;
    stim[53] = 31'h2d4deace;
    stim[54] = 31'h392fba57;
    stim[55] = 31'h2200ae52;
    stim[56] = 31'h34a0da8b;
    stim[57] = 31'h3eaf4bbf;
    stim[58] = 31'h1610c861;
    stim[59] = 31'h379205b4;
    stim[60] = 31'h34be5d38;
    stim[61] = 31'h23da61ff;
    stim[62] = 31'h37f72aa5;
    stim[63] = 31'h17dcb8ef;
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
      expv[0] = 5'h11;
      expv[1] = 5'h11;
      expv[2] = 5'h11;
      expv[3] = 5'h11;
      expv[4] = 5'h11;
      expv[5] = 5'h11;
      expv[6] = 5'h11;
      expv[7] = 5'h11;
      expv[8] = 5'h11;
      expv[9] = 5'h11;
      expv[10] = 5'h11;
      expv[11] = 5'h11;
      expv[12] = 5'h11;
      expv[13] = 5'h11;
      expv[14] = 5'h11;
      expv[15] = 5'h11;
      expv[16] = 5'h11;
      expv[17] = 5'h11;
      expv[18] = 5'h11;
      expv[19] = 5'h11;
      expv[20] = 5'h11;
      expv[21] = 5'h11;
      expv[22] = 5'h11;
      expv[23] = 5'h11;
      expv[24] = 5'h11;
      expv[25] = 5'h11;
      expv[26] = 5'h11;
      expv[27] = 5'h11;
      expv[28] = 5'h11;
      expv[29] = 5'h11;
      expv[30] = 5'h11;
      expv[31] = 5'h11;
      expv[32] = 5'h11;
      expv[33] = 5'h11;
      expv[34] = 5'h11;
      expv[35] = 5'h11;
      expv[36] = 5'h11;
      expv[37] = 5'h11;
      expv[38] = 5'h11;
      expv[39] = 5'h11;
      expv[40] = 5'h11;
      expv[41] = 5'h11;
      expv[42] = 5'h11;
      expv[43] = 5'h11;
      expv[44] = 5'h11;
      expv[45] = 5'h11;
      expv[46] = 5'h11;
      expv[47] = 5'h11;
      expv[48] = 5'h11;
      expv[49] = 5'h11;
      expv[50] = 5'h11;
      expv[51] = 5'h11;
      expv[52] = 5'h11;
      expv[53] = 5'h11;
      expv[54] = 5'h11;
      expv[55] = 5'h11;
      expv[56] = 5'h11;
      expv[57] = 5'h11;
      expv[58] = 5'h11;
      expv[59] = 5'h11;
      expv[60] = 5'h11;
      expv[61] = 5'h11;
      expv[62] = 5'h11;
      expv[63] = 5'h11;
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
