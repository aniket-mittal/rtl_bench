// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_135768 dut (
    .clk(clk),
    .rst(in_vec[33:33]),
    .input_axis_tdata(in_vec[32:25]),
    .input_axis_tvalid(in_vec[24:24]),
    .output_axis_tready(in_vec[23:23]),
    .rxd(in_vec[22:22]),
    .uart_bits(in_vec[21:20]),
    .uart_parity(in_vec[19:18]),
    .uart_stopbit(in_vec[17:16]),
    .prescale(in_vec[15:0]),
    .input_axis_tready(out_vec[14:14]),
    .output_axis_tdata(out_vec[13:6]),
    .output_axis_tvalid(out_vec[5:5]),
    .txd(out_vec[4:4]),
    .tx_busy(out_vec[3:3]),
    .rx_busy(out_vec[2:2]),
    .rx_overrun_error(out_vec[1:1]),
    .rx_frame_error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h22bd9bce2;
    stim[1] = 34'h3c88d319a;
    stim[2] = 34'h05b0662d1;
    stim[3] = 34'h10420198a;
    stim[4] = 34'h1c2d2ccca;
    stim[5] = 34'h1ff337093;
    stim[6] = 34'h0291638ee;
    stim[7] = 34'h1532030d1;
    stim[8] = 34'h30a5696b3;
    stim[9] = 34'h152fedc0e;
    stim[10] = 34'h17f5b2cbf;
    stim[11] = 34'h066303015;
    stim[12] = 34'h0243c6f9c;
    stim[13] = 34'h029c04e01;
    stim[14] = 34'h1832ea21c;
    stim[15] = 34'h1479ce9ed;
    stim[16] = 34'h052e11bdc;
    stim[17] = 34'h0f4600f7b;
    stim[18] = 34'h0992807c3;
    stim[19] = 34'h1110400d5;
    stim[20] = 34'h1df99906c;
    stim[21] = 34'h19ecc508d;
    stim[22] = 34'h070ffaa21;
    stim[23] = 34'h09f250985;
    stim[24] = 34'h182ff83df;
    stim[25] = 34'h13e9b3112;
    stim[26] = 34'h0350542f2;
    stim[27] = 34'h01db644b0;
    stim[28] = 34'h1b7356598;
    stim[29] = 34'h06bd02c69;
    stim[30] = 34'h0a0b4b66f;
    stim[31] = 34'h164f4f773;
    stim[32] = 34'h18efa672b;
    stim[33] = 34'h16fbbcff0;
    stim[34] = 34'h0872a0a54;
    stim[35] = 34'h11cd0c666;
    stim[36] = 34'h199ad8619;
    stim[37] = 34'h06f6d78bf;
    stim[38] = 34'h0460d70f7;
    stim[39] = 34'h1881e4c4b;
    stim[40] = 34'h08dc727d5;
    stim[41] = 34'h12dc95856;
    stim[42] = 34'h09eae0b84;
    stim[43] = 34'h07434eed2;
    stim[44] = 34'h1ea5c8da1;
    stim[45] = 34'h15200de18;
    stim[46] = 34'h0cbedf3de;
    stim[47] = 34'h042a52299;
    stim[48] = 34'h16ac4a518;
    stim[49] = 34'h0752e7077;
    stim[50] = 34'h1b081ba9d;
    stim[51] = 34'h12c792280;
    stim[52] = 34'h14dadddaa;
    stim[53] = 34'h0578dc481;
    stim[54] = 34'h0e4bcba02;
    stim[55] = 34'h039b3fc03;
    stim[56] = 34'h081099f30;
    stim[57] = 34'h08ade5988;
    stim[58] = 34'h1ca600cdf;
    stim[59] = 34'h067dc758f;
    stim[60] = 34'h07dfcc5d4;
    stim[61] = 34'h078cbe638;
    stim[62] = 34'h0e7b30302;
    stim[63] = 34'h18aa3f045;
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
      expv[0] = 15'h40x0;
      expv[1] = 15'h40x0;
      expv[2] = 15'h40x0;
      expv[3] = 15'h40x0;
      expv[4] = 15'h40x0;
      expv[5] = 15'h40x0;
      expv[6] = 15'h40x0;
      expv[7] = 15'h40x0;
      expv[8] = 15'h40x0;
      expv[9] = 15'h40x0;
      expv[10] = 15'h40x0;
      expv[11] = 15'h40x0;
      expv[12] = 15'h40x0;
      expv[13] = 15'h40x0;
      expv[14] = 15'h40x0;
      expv[15] = 15'h40x0;
      expv[16] = 15'h40x0;
      expv[17] = 15'h40x0;
      expv[18] = 15'h40x0;
      expv[19] = 15'h40x0;
      expv[20] = 15'h40x0;
      expv[21] = 15'h40x0;
      expv[22] = 15'h40x0;
      expv[23] = 15'h40x0;
      expv[24] = 15'h40x0;
      expv[25] = 15'h40x0;
      expv[26] = 15'h40x0;
      expv[27] = 15'h40x0;
      expv[28] = 15'h40x0;
      expv[29] = 15'h40x0;
      expv[30] = 15'h40x0;
      expv[31] = 15'h40x0;
      expv[32] = 15'h40x0;
      expv[33] = 15'h40x0;
      expv[34] = 15'h40x0;
      expv[35] = 15'h40x0;
      expv[36] = 15'h40x0;
      expv[37] = 15'h40x0;
      expv[38] = 15'h40x0;
      expv[39] = 15'h40x0;
      expv[40] = 15'h40x0;
      expv[41] = 15'h40x0;
      expv[42] = 15'h40x0;
      expv[43] = 15'h40x0;
      expv[44] = 15'h40x0;
      expv[45] = 15'h40x0;
      expv[46] = 15'h40x0;
      expv[47] = 15'h40x0;
      expv[48] = 15'h40x0;
      expv[49] = 15'h40x0;
      expv[50] = 15'h40x0;
      expv[51] = 15'h40x0;
      expv[52] = 15'h40x0;
      expv[53] = 15'h40x0;
      expv[54] = 15'h40x0;
      expv[55] = 15'h40x0;
      expv[56] = 15'h40x0;
      expv[57] = 15'h40x0;
      expv[58] = 15'h40x0;
      expv[59] = 15'h40x0;
      expv[60] = 15'h40x0;
      expv[61] = 15'h40x0;
      expv[62] = 15'h40x0;
      expv[63] = 15'h40x0;
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
