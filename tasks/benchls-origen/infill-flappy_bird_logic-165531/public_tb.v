// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 85;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_165531 dut (
    .VSync(clk),
    .OriginalClk(in_vec[84:84]),
    .State(in_vec[83:80]),
    .BirdXPosition(in_vec[79:70]),
    .BirdYPosition(in_vec[69:60]),
    .PipeXPosition(in_vec[59:50]),
    .PipeYPosition(in_vec[49:40]),
    .SpeedUpXPosition(in_vec[39:30]),
    .SpeedUpYPosition(in_vec[29:20]),
    .HealthXPosition(in_vec[19:10]),
    .HealthYPosition(in_vec[9:0]),
    .RequestSpeedUp(out_vec[13:13]),
    .RequestHealth(out_vec[12:12]),
    .RequestDie(out_vec[11:11]),
    .Score(out_vec[10:3]),
    .Health(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 85'h16e220f48258ccd807ad6c;
    stim[1] = 85'h0525a1de0ee1d0d535abae;
    stim[2] = 85'h1dfd9a6b612ea3b7b33330;
    stim[3] = 85'h1929964a9e4704a05f41b6;
    stim[4] = 85'h14eb15cec108f6d0e33760;
    stim[5] = 85'h09a4ccb4802e8f9425abc7;
    stim[6] = 85'h0488b166358076fa20eb9a;
    stim[7] = 85'h15024067cfcf16ba3c6bfb;
    stim[8] = 85'h1b4e6e985fc9ed827d9580;
    stim[9] = 85'h1d1f585f2f02c3feb1f98e;
    stim[10] = 85'h040c8d22810b40cfaaca8d;
    stim[11] = 85'h0b36a1341a10d2d4e1c81b;
    stim[12] = 85'h18d623f0a16bdfacc07bb9;
    stim[13] = 85'h1d2337a1373d24ffea75a9;
    stim[14] = 85'h0680b462dec89ec90fe0a2;
    stim[15] = 85'h0742f9a8c2e464b1a551f3;
    stim[16] = 85'h139317bc46920e81da2103;
    stim[17] = 85'h1aa6e87e498828575d3d8c;
    stim[18] = 85'h0b7c7d7a1c7a9116af1ecd;
    stim[19] = 85'h0e68df302ac004d45205ca;
    stim[20] = 85'h16c2c2037cf25b23c4ea34;
    stim[21] = 85'h10530a83e417cacdb286d9;
    stim[22] = 85'h1d3630b2b5e242f96dca98;
    stim[23] = 85'h130eee4a6cb01da25c001b;
    stim[24] = 85'h1fc5626f404339240ac88f;
    stim[25] = 85'h17a29e94f9f92bc1b0329f;
    stim[26] = 85'h1671d51919520fc0ea097b;
    stim[27] = 85'h09b072dd590248d8d8a257;
    stim[28] = 85'h0eb46c02be016e7f91ea59;
    stim[29] = 85'h0b2b6ecc64745ce03b935b;
    stim[30] = 85'h07a8401beafa6848e7e4e0;
    stim[31] = 85'h039cec788a3ed7318aa8ab;
    stim[32] = 85'h15939033545cf95f6ad881;
    stim[33] = 85'h1f2e523786ddbeeb00805f;
    stim[34] = 85'h140975484e0d741e382b73;
    stim[35] = 85'h12908f0d022b4db25d188f;
    stim[36] = 85'h02e4375ed0337e3c6c39d2;
    stim[37] = 85'h02c2d1b33cdd0bcfb336e3;
    stim[38] = 85'h19f86cd6faa849a4b2d2fe;
    stim[39] = 85'h00da0437697a8db4b7c31a;
    stim[40] = 85'h02c9c0655069f68b6eef99;
    stim[41] = 85'h12b38db4e3237dcf2a89e7;
    stim[42] = 85'h19a8c9be1a8a6b6403a8b2;
    stim[43] = 85'h1d8d6ec2124201cd2f1e0d;
    stim[44] = 85'h04f52c656c4b3254da3cce;
    stim[45] = 85'h038daee2c300a87ba21557;
    stim[46] = 85'h0c0ac6bd1f51bd3ecb6a4a;
    stim[47] = 85'h0610772ca16a18db76b449;
    stim[48] = 85'h0a4f442356de3fe34d310a;
    stim[49] = 85'h0601d42ca08ad900c37251;
    stim[50] = 85'h16f18025a380227fcb0677;
    stim[51] = 85'h132903b4f5f23cced298cf;
    stim[52] = 85'h1ba7bbb7ad378e7d4f3e64;
    stim[53] = 85'h0e31a91d4a31928833ddf3;
    stim[54] = 85'h0be0eb1f798bc51fef37b6;
    stim[55] = 85'h1eb18ed755e69531cef117;
    stim[56] = 85'h145e72666c49c159d7daf0;
    stim[57] = 85'h0fa49bb2f37513b7744251;
    stim[58] = 85'h174c76fff6000fd3ded2e2;
    stim[59] = 85'h1d2f1e7fd25f61771732b6;
    stim[60] = 85'h1b8181b2c72df0637eedbe;
    stim[61] = 85'h1d46403ec4c50e07a030b9;
    stim[62] = 85'h16768920e7e83c580c21b3;
    stim[63] = 85'h0024ff623e0908e832cd73;
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
      expv[1] = 14'h0xxx;
      expv[2] = 14'h0xxx;
      expv[3] = 14'h0xxx;
      expv[4] = 14'h0xxx;
      expv[5] = 14'h0001;
      expv[6] = 14'h0001;
      expv[7] = 14'h0001;
      expv[8] = 14'h0001;
      expv[9] = 14'h0001;
      expv[10] = 14'h0001;
      expv[11] = 14'h0001;
      expv[12] = 14'h0001;
      expv[13] = 14'h0001;
      expv[14] = 14'h0001;
      expv[15] = 14'h0001;
      expv[16] = 14'h0001;
      expv[17] = 14'h0001;
      expv[18] = 14'h0001;
      expv[19] = 14'h0001;
      expv[20] = 14'h0001;
      expv[21] = 14'h0001;
      expv[22] = 14'h0001;
      expv[23] = 14'h0001;
      expv[24] = 14'h0001;
      expv[25] = 14'h0001;
      expv[26] = 14'h0001;
      expv[27] = 14'h0001;
      expv[28] = 14'h0001;
      expv[29] = 14'h0001;
      expv[30] = 14'h0001;
      expv[31] = 14'h0001;
      expv[32] = 14'h0001;
      expv[33] = 14'h0001;
      expv[34] = 14'h0001;
      expv[35] = 14'h0001;
      expv[36] = 14'h0001;
      expv[37] = 14'h0001;
      expv[38] = 14'h0001;
      expv[39] = 14'h0001;
      expv[40] = 14'h0001;
      expv[41] = 14'h0001;
      expv[42] = 14'h0001;
      expv[43] = 14'h0001;
      expv[44] = 14'h0001;
      expv[45] = 14'h0001;
      expv[46] = 14'h0001;
      expv[47] = 14'h0001;
      expv[48] = 14'h0001;
      expv[49] = 14'h0001;
      expv[50] = 14'h0001;
      expv[51] = 14'h0001;
      expv[52] = 14'h0001;
      expv[53] = 14'h0001;
      expv[54] = 14'h0001;
      expv[55] = 14'h0001;
      expv[56] = 14'h0001;
      expv[57] = 14'h0001;
      expv[58] = 14'h0001;
      expv[59] = 14'h0001;
      expv[60] = 14'h0001;
      expv[61] = 14'h0001;
      expv[62] = 14'h0001;
      expv[63] = 14'h0001;
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
