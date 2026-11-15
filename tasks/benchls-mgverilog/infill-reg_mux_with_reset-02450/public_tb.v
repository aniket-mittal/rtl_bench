// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02450 dut (
    .clock(clk),
    .reset(in_vec[66:66]),
    .io_input_0_data(in_vec[65:34]),
    .io_input_0_init(in_vec[33:2]),
    .io_input_0_enable(in_vec[1:1]),
    .io_input_0_reset(in_vec[0:0]),
    .io_output_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h4e34b007be2d4d7b3;
    stim[1] = 67'h573f54fa57256a5ae;
    stim[2] = 67'h23183f5310fa1ea97;
    stim[3] = 67'h3bcf6cad2577fc522;
    stim[4] = 67'h2190d6f703c290be5;
    stim[5] = 67'h197c63e7811456f9f;
    stim[6] = 67'h2c92ecbdeb8b9d29b;
    stim[7] = 67'h0f8f8f5b3dcbfe868;
    stim[8] = 67'h2b46658857c2d6575;
    stim[9] = 67'h1b2721e8ae76e380d;
    stim[10] = 67'h093977c28be789cb9;
    stim[11] = 67'h12aac7602d62b3dd5;
    stim[12] = 67'h1c6859be504f934a9;
    stim[13] = 67'h20a3fb7b1077f3a8c;
    stim[14] = 67'h15e303aa4fba64c7e;
    stim[15] = 67'h024078ecbe892aff4;
    stim[16] = 67'h055b351e5576367df;
    stim[17] = 67'h34204ca9bfbe24059;
    stim[18] = 67'h1bdacdd0fa3027f75;
    stim[19] = 67'h0f7ac124b92bcddb1;
    stim[20] = 67'h15ec34f4b23ed96ea;
    stim[21] = 67'h0ccbd72bb1247d610;
    stim[22] = 67'h224478b9effeb6137;
    stim[23] = 67'h230839bda9e715c42;
    stim[24] = 67'h004d9f55dd5d8a3bf;
    stim[25] = 67'h1f8176b0ec9b3bffb;
    stim[26] = 67'h0accd6a3c944369e1;
    stim[27] = 67'h1435ff20e02dbea4d;
    stim[28] = 67'h2645a7777e54e3095;
    stim[29] = 67'h2597ddc1ad5875a2d;
    stim[30] = 67'h25f269b1e94efeb51;
    stim[31] = 67'h3e3645028b5d6b762;
    stim[32] = 67'h03b7b8cbeb1420116;
    stim[33] = 67'h09b55190f1e9c91fa;
    stim[34] = 67'h3eaf667bc42f66684;
    stim[35] = 67'h33642d93b1b5585de;
    stim[36] = 67'h2f6a2f03a30cf72bd;
    stim[37] = 67'h137a2ab7aa6a2632b;
    stim[38] = 67'h06954d222c4cff0c3;
    stim[39] = 67'h3873314f85f1ec371;
    stim[40] = 67'h0236af84497b67cf4;
    stim[41] = 67'h391a2c98fa67a76db;
    stim[42] = 67'h1955c77a1a84d91b0;
    stim[43] = 67'h181d174d2f734c539;
    stim[44] = 67'h3f7444acf625c511f;
    stim[45] = 67'h13d75be2f52dc2fd8;
    stim[46] = 67'h2a9f375d12831aafe;
    stim[47] = 67'h13e999c3229a3e760;
    stim[48] = 67'h00632471aa59b30e9;
    stim[49] = 67'h0462722e9698ee09b;
    stim[50] = 67'h152ce57bd01d3426e;
    stim[51] = 67'h3ca57758eb8e002c8;
    stim[52] = 67'h3d4b340da9d66c761;
    stim[53] = 67'h3a4f7393c44f6ca11;
    stim[54] = 67'h34758173ec321580e;
    stim[55] = 67'h026eb16837d06978e;
    stim[56] = 67'h393425b03779f7e03;
    stim[57] = 67'h500710fea1717cda6;
    stim[58] = 67'h25b774aecfc73c006;
    stim[59] = 67'h25e72f180a8897ab6;
    stim[60] = 67'h2cdbbe9f601fb4610;
    stim[61] = 67'h29da858c3602a8bbf;
    stim[62] = 67'h121644b584345eedc;
    stim[63] = 67'h013390a295fd60256;
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
      expv[0] = 32'hf8b535ec;
      expv[1] = 32'hf8b535ec;
      expv[2] = 32'h43e87aa5;
      expv[3] = 32'h43e87aa5;
      expv[4] = 32'h0f0a42f9;
      expv[5] = 32'h04515be7;
      expv[6] = 32'hae2e74a6;
      expv[7] = 32'hae2e74a6;
      expv[8] = 32'h5f0b595d;
      expv[9] = 32'hb9db8e03;
      expv[10] = 32'h2f9e272e;
      expv[11] = 32'hb58acf75;
      expv[12] = 32'h413e4d2a;
      expv[13] = 32'h413e4d2a;
      expv[14] = 32'h413e4d2a;
      expv[15] = 32'h578c0ea9;
      expv[16] = 32'h55d8d9f7;
      expv[17] = 32'hfef89016;
      expv[18] = 32'he8c09fdd;
      expv[19] = 32'he4af376c;
      expv[20] = 32'he4af376c;
      expv[21] = 32'h57b0d3d2;
      expv[22] = 32'hbffad84d;
      expv[23] = 32'hbffad84d;
      expv[24] = 32'h757628ef;
      expv[25] = 32'hb26ceffe;
      expv[26] = 32'h2510da78;
      expv[27] = 32'h80b6fa93;
      expv[28] = 32'hf9538c25;
      expv[29] = 32'hb561d68b;
      expv[30] = 32'ha53bfad4;
      expv[31] = 32'ha53bfad4;
      expv[32] = 32'hf8d9140a;
      expv[33] = 32'h0edee32f;
      expv[34] = 32'h26d54643;
      expv[35] = 32'h26d54643;
      expv[36] = 32'h8c33dcaf;
      expv[37] = 32'ha9a898ca;
      expv[38] = 32'hb133fc30;
      expv[39] = 32'h17c7b0dc;
      expv[40] = 32'h17c7b0dc;
      expv[41] = 32'he99e9db6;
      expv[42] = 32'he99e9db6;
      expv[43] = 32'hbdcd314e;
      expv[44] = 32'hd8971447;
      expv[45] = 32'hd8971447;
      expv[46] = 32'hd8971447;
      expv[47] = 32'haa7cdd74;
      expv[48] = 32'ha966cc3a;
      expv[49] = 32'h5a63b826;
      expv[50] = 32'h5a63b826;
      expv[51] = 32'h54b395ef;
      expv[52] = 32'ha759b1d8;
      expv[53] = 32'h113db284;
      expv[54] = 32'h113db284;
      expv[55] = 32'hd1d605cf;
      expv[56] = 32'hdde7df80;
      expv[57] = 32'hdde7df80;
      expv[58] = 32'h85c5f369;
      expv[59] = 32'h96ddd2bb;
      expv[60] = 32'h979cbc60;
      expv[61] = 32'hd80aa2ef;
      expv[62] = 32'hd80aa2ef;
      expv[63] = 32'hd80aa2ef;
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
