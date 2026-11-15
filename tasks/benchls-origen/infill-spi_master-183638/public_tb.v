// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_183638 dut (
    .clk(clk),
    .rst(in_vec[20:20]),
    .miso(in_vec[19:19]),
    .start(in_vec[18:18]),
    .cpol(in_vec[17:17]),
    .cpha(in_vec[16:16]),
    .clk_div(in_vec[15:8]),
    .data_in(in_vec[7:0]),
    .sck(out_vec[10:10]),
    .mosi(out_vec[9:9]),
    .busy(out_vec[8:8]),
    .data_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h11c847;
    stim[1] = 21'h1ec313;
    stim[2] = 21'h059e48;
    stim[3] = 21'h04f793;
    stim[4] = 21'h014983;
    stim[5] = 21'h02f15a;
    stim[6] = 21'h0cae8a;
    stim[7] = 21'h014c60;
    stim[8] = 21'h0d4c5d;
    stim[9] = 21'h008de2;
    stim[10] = 21'h07f3fc;
    stim[11] = 21'h0fd161;
    stim[12] = 21'h0d97ae;
    stim[13] = 21'h08652f;
    stim[14] = 21'h0264f2;
    stim[15] = 21'h0bc111;
    stim[16] = 21'h0c1698;
    stim[17] = 21'h050a70;
    stim[18] = 21'h0416c8;
    stim[19] = 21'h051688;
    stim[20] = 21'h089c92;
    stim[21] = 21'h0f6fbb;
    stim[22] = 21'h0185ca;
    stim[23] = 21'h0e54cd;
    stim[24] = 21'h0eef86;
    stim[25] = 21'h003a64;
    stim[26] = 21'h08493c;
    stim[27] = 21'h06728b;
    stim[28] = 21'h0e01f7;
    stim[29] = 21'h0eee1b;
    stim[30] = 21'h0f4940;
    stim[31] = 21'h18433f;
    stim[32] = 21'h09f48e;
    stim[33] = 21'h0f0d55;
    stim[34] = 21'h002f96;
    stim[35] = 21'h081af6;
    stim[36] = 21'h0ee384;
    stim[37] = 21'h0d3b8b;
    stim[38] = 21'h0f065d;
    stim[39] = 21'h033355;
    stim[40] = 21'h070e94;
    stim[41] = 21'h01cd83;
    stim[42] = 21'h0bf712;
    stim[43] = 21'h07c580;
    stim[44] = 21'h0ab4e8;
    stim[45] = 21'h0c3cb8;
    stim[46] = 21'h086226;
    stim[47] = 21'h0137de;
    stim[48] = 21'h0a36e1;
    stim[49] = 21'h0bf1c9;
    stim[50] = 21'h0807ae;
    stim[51] = 21'h15ff34;
    stim[52] = 21'h0ea37d;
    stim[53] = 21'h0952e3;
    stim[54] = 21'h0c0933;
    stim[55] = 21'h0e1794;
    stim[56] = 21'h01d041;
    stim[57] = 21'h0c06b1;
    stim[58] = 21'h0eea65;
    stim[59] = 21'h0276c2;
    stim[60] = 21'h0b8022;
    stim[61] = 21'h0e7f0f;
    stim[62] = 21'h0ca8fe;
    stim[63] = 21'h0c95c5;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h100;
      expv[4] = 11'h100;
      expv[5] = 11'h100;
      expv[6] = 11'h100;
      expv[7] = 11'h100;
      expv[8] = 11'h100;
      expv[9] = 11'h100;
      expv[10] = 11'h100;
      expv[11] = 11'h300;
      expv[12] = 11'h300;
      expv[13] = 11'h300;
      expv[14] = 11'h300;
      expv[15] = 11'h100;
      expv[16] = 11'h100;
      expv[17] = 11'h100;
      expv[18] = 11'h100;
      expv[19] = 11'h100;
      expv[20] = 11'h100;
      expv[21] = 11'h100;
      expv[22] = 11'h100;
      expv[23] = 11'h100;
      expv[24] = 11'h100;
      expv[25] = 11'h100;
      expv[26] = 11'h000;
      expv[27] = 11'h000;
      expv[28] = 11'h100;
      expv[29] = 11'h100;
      expv[30] = 11'h100;
      expv[31] = 11'h000;
      expv[32] = 11'h000;
      expv[33] = 11'h000;
      expv[34] = 11'h100;
      expv[35] = 11'h100;
      expv[36] = 11'h100;
      expv[37] = 11'h100;
      expv[38] = 11'h100;
      expv[39] = 11'h300;
      expv[40] = 11'h100;
      expv[41] = 11'h300;
      expv[42] = 11'h300;
      expv[43] = 11'h100;
      expv[44] = 11'h100;
      expv[45] = 11'h100;
      expv[46] = 11'h100;
      expv[47] = 11'h000;
      expv[48] = 11'h000;
      expv[49] = 11'h000;
      expv[50] = 11'h000;
      expv[51] = 11'h000;
      expv[52] = 11'h000;
      expv[53] = 11'h100;
      expv[54] = 11'h100;
      expv[55] = 11'h300;
      expv[56] = 11'h300;
      expv[57] = 11'h300;
      expv[58] = 11'h500;
      expv[59] = 11'h500;
      expv[60] = 11'h500;
      expv[61] = 11'h700;
      expv[62] = 11'h700;
      expv[63] = 11'h700;
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
