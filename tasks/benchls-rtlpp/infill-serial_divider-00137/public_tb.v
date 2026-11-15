// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00137 dut (
    .clk_i(clk),
    .clk_en_i(in_vec[26:26]),
    .rst_i(in_vec[25:25]),
    .divide_i(in_vec[24:24]),
    .dividend_i(in_vec[23:8]),
    .divisor_i(in_vec[7:0]),
    .quotient_o(out_vec[16:1]),
    .done_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h3128627;
    stim[1] = 27'h7535d08;
    stim[2] = 27'h4cd8a5b;
    stim[3] = 27'h0518d3f;
    stim[4] = 27'h145cff6;
    stim[5] = 27'h06cfa3e;
    stim[6] = 27'h1bc308c;
    stim[7] = 27'h5c0d723;
    stim[8] = 27'h55adafb;
    stim[9] = 27'h4240ff2;
    stim[10] = 27'h442f18b;
    stim[11] = 27'h1ec0f99;
    stim[12] = 27'h1937b8b;
    stim[13] = 27'h55385d8;
    stim[14] = 27'h4de2f1f;
    stim[15] = 27'h52cd129;
    stim[16] = 27'h1ed3f2f;
    stim[17] = 27'h56a44d8;
    stim[18] = 27'h110be06;
    stim[19] = 27'h0af2e5f;
    stim[20] = 27'h175e4b8;
    stim[21] = 27'h596856e;
    stim[22] = 27'h5d741e9;
    stim[23] = 27'h05cd3e4;
    stim[24] = 27'h4e9fd4f;
    stim[25] = 27'h4340806;
    stim[26] = 27'h1416408;
    stim[27] = 27'h5004d07;
    stim[28] = 27'h14d640c;
    stim[29] = 27'h4cc363e;
    stim[30] = 27'h59f2509;
    stim[31] = 27'h410fea5;
    stim[32] = 27'h0401c56;
    stim[33] = 27'h4a1dca0;
    stim[34] = 27'h089dab2;
    stim[35] = 27'h146043a;
    stim[36] = 27'h17e3979;
    stim[37] = 27'h0b9474a;
    stim[38] = 27'h5f0ee33;
    stim[39] = 27'h094ef2e;
    stim[40] = 27'h512517a;
    stim[41] = 27'h1f3a3dc;
    stim[42] = 27'h56acb9a;
    stim[43] = 27'h15953d3;
    stim[44] = 27'h53e81de;
    stim[45] = 27'h0846290;
    stim[46] = 27'h1f9220c;
    stim[47] = 27'h5791379;
    stim[48] = 27'h572560f;
    stim[49] = 27'h11512d1;
    stim[50] = 27'h072905a;
    stim[51] = 27'h0d058e2;
    stim[52] = 27'h459694e;
    stim[53] = 27'h47a6fcc;
    stim[54] = 27'h4756007;
    stim[55] = 27'h44122a2;
    stim[56] = 27'h4c66170;
    stim[57] = 27'h4ce493e;
    stim[58] = 27'h4a48ccb;
    stim[59] = 27'h1f96d0c;
    stim[60] = 27'h54956e2;
    stim[61] = 27'h5986e26;
    stim[62] = 27'h43a40a8;
    stim[63] = 27'h1f8eb75;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00002;
      expv[4] = 17'h00002;
      expv[5] = 17'h00002;
      expv[6] = 17'h00002;
      expv[7] = 17'h00002;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00002;
      expv[12] = 17'h00002;
      expv[13] = 17'h00002;
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
      expv[24] = 17'h00000;
      expv[25] = 17'h00002;
      expv[26] = 17'h00006;
      expv[27] = 17'h00006;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00002;
      expv[33] = 17'h00002;
      expv[34] = 17'h00006;
      expv[35] = 17'h00006;
      expv[36] = 17'h00006;
      expv[37] = 17'h00006;
      expv[38] = 17'h00006;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00002;
      expv[54] = 17'h00006;
      expv[55] = 17'h0000e;
      expv[56] = 17'h0001e;
      expv[57] = 17'h0003e;
      expv[58] = 17'h0007e;
      expv[59] = 17'h000fe;
      expv[60] = 17'h000fe;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00002;
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
