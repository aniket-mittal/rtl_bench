// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02527 dut (
    .clk(clk),
    .rst(in_vec[99:99]),
    .IF_stall(in_vec[98:98]),
    .IF_flush(in_vec[97:97]),
    .ID_stall(in_vec[96:96]),
    .IF_inst(in_vec[95:64]),
    .IF_PCnext(in_vec[63:32]),
    .IF_PC(in_vec[31:0]),
    .ID_inst(out_vec[63:32]),
    .ID_PCnext(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'hb41a2e09611c79410d2b063d7;
    stim[1] = 100'he48956bf853e3de23977ca8a3;
    stim[2] = 100'h74da645ca40a1cc98ddd089ed;
    stim[3] = 100'h530af37127df074c7d348bdba;
    stim[4] = 100'h171c13c89949b4be41d5f9992;
    stim[5] = 100'h76e546be18a2cd9ac419bd9a2;
    stim[6] = 100'h6a75c80f22d029ac648595e1f;
    stim[7] = 100'h61e6dd89bc963aa3c3ca422c3;
    stim[8] = 100'h33a07b7ecd5cf7f2be45897fa;
    stim[9] = 100'h414aa42c633f1c21593fb8e78;
    stim[10] = 100'h3690cb85b69272551a16fec04;
    stim[11] = 100'h0a03859876e1b3b410c3968a6;
    stim[12] = 100'h25ccc466bee0ca17433a53155;
    stim[13] = 100'h52e3c914a9336ef60b9ce2a48;
    stim[14] = 100'hc278128d9216344c56f9ac9b4;
    stim[15] = 100'h4a061c286702c5a43784fc3d9;
    stim[16] = 100'h7ae7a880159fcdf3b181dd137;
    stim[17] = 100'h333af3f0461b29ef55d2042e3;
    stim[18] = 100'h519a3c9d11632c9e0c282a21b;
    stim[19] = 100'h6c1761165774785f3ff88a5a7;
    stim[20] = 100'h34c40271f01410a5440241d54;
    stim[21] = 100'h013251c7dbe300cf5394c9cd4;
    stim[22] = 100'h1914d2920bb213e76c5034538;
    stim[23] = 100'h1e51de560b5a952b32b8c6a0c;
    stim[24] = 100'h6def2abf4a6a05d2bba6841b2;
    stim[25] = 100'h1722d424a40ccd0c42015bb4a;
    stim[26] = 100'h5e79b394276af6df31caf9d26;
    stim[27] = 100'h056a510a0399f675c5552ee34;
    stim[28] = 100'h6d54dc3e7d3317e4c4a99b7ec;
    stim[29] = 100'h4a6c3b9ded10a669187d877cc;
    stim[30] = 100'h2cc56a08dee988c3ebcfb2737;
    stim[31] = 100'h1eb91402f63a78d00f096d91d;
    stim[32] = 100'h771217ae6b5e35fe7c1021fce;
    stim[33] = 100'h4dd4aeeeea4a3a0a7c215868c;
    stim[34] = 100'h0ee206042d21d8c1e1adc1f3d;
    stim[35] = 100'h3cf3e6f429dfc57edc98a338b;
    stim[36] = 100'h221d4ccfaa89e19a1c088c095;
    stim[37] = 100'h2a550944d4a600390a34e6cc0;
    stim[38] = 100'h2114692896f0413741422252e;
    stim[39] = 100'h7670bf23ba86a902b1b7cbfeb;
    stim[40] = 100'h59469668d1da20501fa16184c;
    stim[41] = 100'h585138c37c9a3039dc5f3afcb;
    stim[42] = 100'h3743bc10a1ddce902afa1a6fe;
    stim[43] = 100'h7ef7f474d943f579f9cfbc90c;
    stim[44] = 100'h1558cab68331340a857ec1d58;
    stim[45] = 100'h6320e3ea8eb7d3b080b5f74ae;
    stim[46] = 100'h2172eb6290359910e16582602;
    stim[47] = 100'h75d9b4f9630f5c4e56ac88b7f;
    stim[48] = 100'h17e8a7d032bbb8ef0394d1bcd;
    stim[49] = 100'h275ddc93ce19e4d5e6e7d8571;
    stim[50] = 100'h0c615c0bec06d3f83376b005e;
    stim[51] = 100'h089368213ec10d74cd4ac606d;
    stim[52] = 100'h2181916107a51dfc309b75c9f;
    stim[53] = 100'h040fce9751ad72960fd7cac92;
    stim[54] = 100'h27461a4ba4bde2adc5b363de0;
    stim[55] = 100'h0a7d9f2b7358271fc10fc424a;
    stim[56] = 100'h18a67e6f8b33ab62579362de9;
    stim[57] = 100'h2583d96948ac5b3fedb595a5b;
    stim[58] = 100'h4267766e14ecff527d7fdb343;
    stim[59] = 100'h59140fb53ca1351a7a66f9055;
    stim[60] = 100'h20b5b704944497a0f29ce1306;
    stim[61] = 100'h46559dad270732dc1c9746d5e;
    stim[62] = 100'h267db33df8eab737070087916;
    stim[63] = 100'h639b01f209ec941b684b8fbe9;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h000000002d029ac6;
      expv[8] = 64'h00000000c963aa3c;
      expv[9] = 64'h00000000c963aa3c;
      expv[10] = 64'h0000000033f1c215;
      expv[11] = 64'h0000000033f1c215;
      expv[12] = 64'ha03859876e1b3b41;
      expv[13] = 64'h00000000ee0ca174;
      expv[14] = 64'h00000000ee0ca174;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h00000000702c5a43;
      expv[17] = 64'h00000000702c5a43;
      expv[18] = 64'h00000000702c5a43;
      expv[19] = 64'h00000000702c5a43;
      expv[20] = 64'h00000000774785f3;
      expv[21] = 64'h00000000774785f3;
      expv[22] = 64'h13251c7dbe300cf5;
      expv[23] = 64'h13251c7dbe300cf5;
      expv[24] = 64'h13251c7dbe300cf5;
      expv[25] = 64'h00000000a6a05d2b;
      expv[26] = 64'h00000000a6a05d2b;
      expv[27] = 64'h00000000a6a05d2b;
      expv[28] = 64'h56a510a0399f675c;
      expv[29] = 64'h00000000d3317e4c;
      expv[30] = 64'h00000000d10a6691;
      expv[31] = 64'h00000000ee988c3e;
      expv[32] = 64'h00000000ee988c3e;
      expv[33] = 64'h00000000ee988c3e;
      expv[34] = 64'h00000000a4a3a0a7;
      expv[35] = 64'hee206042d21d8c1e;
      expv[36] = 64'hee206042d21d8c1e;
      expv[37] = 64'h00000000a89e19a1;
      expv[38] = 64'h000000004a600390;
      expv[39] = 64'h000000006f041374;
      expv[40] = 64'h000000006f041374;
      expv[41] = 64'h000000006f041374;
      expv[42] = 64'h000000006f041374;
      expv[43] = 64'h000000006f041374;
      expv[44] = 64'h000000006f041374;
      expv[45] = 64'h000000006f041374;
      expv[46] = 64'h00000000eb7d3b08;
      expv[47] = 64'h000000000359910e;
      expv[48] = 64'h000000000359910e;
      expv[49] = 64'h000000000359910e;
      expv[50] = 64'h00000000e19e4d5e;
      expv[51] = 64'hc615c0bec06d3f83;
      expv[52] = 64'h89368213ec10d74c;
      expv[53] = 64'h000000007a51dfc3;
      expv[54] = 64'h40fce9751ad72960;
      expv[55] = 64'h000000004bde2adc;
      expv[56] = 64'ha7d9f2b7358271fc;
      expv[57] = 64'ha7d9f2b7358271fc;
      expv[58] = 64'h000000008ac5b3fe;
      expv[59] = 64'h000000004ecff527;
      expv[60] = 64'h000000004ecff527;
      expv[61] = 64'h0000000044497a0f;
      expv[62] = 64'h0000000070732dc1;
      expv[63] = 64'h000000008eab7370;
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
