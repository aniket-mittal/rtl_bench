// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 54;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08796 dut (
    .clk(clk),
    .x(in_vec[48:33]),
    .y(in_vec[32:17]),
    .z(in_vec[16:1]),
    .mode(in_vec[0:0]),
    .x_rot(out_vec[53:36]),
    .y_rot(out_vec[35:18]),
    .z_rot(out_vec[17:2]),
    .d(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h1feff49ff69db;
    stim[1] = 49'h0abf0bd478dc1;
    stim[2] = 49'h195c59d668081;
    stim[3] = 49'h19cca651e9a8c;
    stim[4] = 49'h0872817898639;
    stim[5] = 49'h08d30c3aeb2a9;
    stim[6] = 49'h0f948dcfe4d04;
    stim[7] = 49'h06ece2f340523;
    stim[8] = 49'h1a49f43fadda4;
    stim[9] = 49'h17f0d165faa90;
    stim[10] = 49'h0ed21cfafa7ea;
    stim[11] = 49'h049bd9e80f83a;
    stim[12] = 49'h07ea29430635a;
    stim[13] = 49'h10dcf04f441bf;
    stim[14] = 49'h0c006ea63bbac;
    stim[15] = 49'h0a49853087b2e;
    stim[16] = 49'h00a4ce117863d;
    stim[17] = 49'h1ac900f9f650b;
    stim[18] = 49'h1dc1c9b581739;
    stim[19] = 49'h045d7fe927809;
    stim[20] = 49'h12983d3a13464;
    stim[21] = 49'h1dead71a39a18;
    stim[22] = 49'h16cbf07bc9219;
    stim[23] = 49'h1fe394aefc180;
    stim[24] = 49'h135f0221fdbd8;
    stim[25] = 49'h15aa9ca2283c2;
    stim[26] = 49'h0b687734bb174;
    stim[27] = 49'h1ba02019f0a9d;
    stim[28] = 49'h14eeeea129d52;
    stim[29] = 49'h0caef8166f634;
    stim[30] = 49'h01e24c25b0355;
    stim[31] = 49'h0ef89e615f399;
    stim[32] = 49'h1f0604dc2c5f9;
    stim[33] = 49'h10aaafbc590ab;
    stim[34] = 49'h15e237d1fa175;
    stim[35] = 49'h137ef1207e297;
    stim[36] = 49'h042f81440ccf2;
    stim[37] = 49'h0bf4a86300b68;
    stim[38] = 49'h0a73a2694d5c0;
    stim[39] = 49'h0ba59dfc1427b;
    stim[40] = 49'h16e4dc445519b;
    stim[41] = 49'h0e9b42920c77a;
    stim[42] = 49'h1b1a0d23e7362;
    stim[43] = 49'h0b977e3b0b047;
    stim[44] = 49'h1a015d9d421c5;
    stim[45] = 49'h12fe6844b619c;
    stim[46] = 49'h05469d39ccd1e;
    stim[47] = 49'h131605787c2c8;
    stim[48] = 49'h16a66879513ed;
    stim[49] = 49'h09476e2fd3077;
    stim[50] = 49'h16ae3f43c9fdf;
    stim[51] = 49'h0d42f4cbdc8fd;
    stim[52] = 49'h1d4ac57d8ccf8;
    stim[53] = 49'h1be284237575d;
    stim[54] = 49'h07fc55e5eeb46;
    stim[55] = 49'h1c8f01cc9a44a;
    stim[56] = 49'h1846efc2ed006;
    stim[57] = 49'h0df88d1ccde31;
    stim[58] = 49'h0f234c36cefed;
    stim[59] = 49'h1c1b2aa2c5bd6;
    stim[60] = 49'h1edb54233f9b2;
    stim[61] = 49'h0879255acad0f;
    stim[62] = 49'h1fd0787d9e21f;
    stim[63] = 49'h11df22f607e4d;
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
      expv[0] = 54'hxxxxxxxxxxxxxx;
      expv[1] = 54'h0008116c04d3bx;
      expv[2] = 54'h055f817a8f1b8x;
      expv[3] = 54'h0351e0c537010x;
      expv[4] = 54'h3ce650ca3f351f;
      expv[5] = 54'h0439402f130c73;
      expv[6] = 54'h046981875d6553;
      expv[7] = 54'h07ca41b9fc9a09;
      expv[8] = 54'h0376705e680a45;
      expv[9] = 54'h3d24fe87f7bb4f;
      expv[10] = 54'h3bf86e2cbf5521;
      expv[11] = 54'h07690f9f5f4fd5;
      expv[12] = 54'h024def3d03f07b;
      expv[13] = 54'h03f5112860c6b5;
      expv[14] = 54'h079191f61a8381;
      expv[15] = 54'h060031d4c77759;
      expv[16] = 54'h0524c0a610f65d;
      expv[17] = 54'h005261c22f0c79;
      expv[18] = 54'h029b8fe0c4ca19;
      expv[19] = 54'h011f2ec9522e75;
      expv[20] = 54'h022ebffd24f011;
      expv[21] = 54'h394c1fa74068c7;
      expv[22] = 54'h3ef56ee3473431;
      expv[23] = 54'h049a11f08b2435;
      expv[24] = 54'h3ff1ce95df8301;
      expv[25] = 54'h39af80443fb7b1;
      expv[26] = 54'h3ad54f9447078b;
      expv[27] = 54'h05b43ee69762e9;
      expv[28] = 54'h022ffffcc4153d;
      expv[29] = 54'h3a7771d4273aab;
      expv[30] = 54'h06577f02cfec6f;
      expv[31] = 54'h00f12184b606ab;
      expv[32] = 54'h077c4fcc2be733;
      expv[33] = 54'h007d0f647f8bf7;
      expv[34] = 54'h07aabe0879215b;
      expv[35] = 54'h050ef105c542ef;
      expv[36] = 54'h064091dbf5c533;
      expv[37] = 54'h0217c0288399eb;
      expv[38] = 54'h05fa510c6016d1;
      expv[39] = 54'h0539d04d2bab87;
      expv[40] = 54'h05d2cfbf8284f7;
      expv[41] = 54'h048da07778a33b;
      expv[42] = 54'h074da052438efb;
      expv[43] = 54'h3d8d01a47ce6c5;
      expv[44] = 54'h05cbbfc761608d;
      expv[45] = 54'h02ff604c5a438d;
      expv[46] = 54'h397f310894c337;
      expv[47] = 54'h02a34fa73b9a43;
      expv[48] = 54'h398b00af0f8591;
      expv[49] = 54'h04acdef0d827dd;
      expv[50] = 54'h04a3b1c5fa60ed;
      expv[51] = 54'h04a8f0178b3fc1;
      expv[52] = 54'h06a17e997b91f9;
      expv[53] = 54'h3ea560afb399f7;
      expv[54] = 54'h020ecf7b94aebf;
      expv[55] = 54'h03fe2ebcbfd693;
      expv[56] = 54'h3e478039934895;
      expv[57] = 54'h3c2371f85fa013;
      expv[58] = 54'h06fc41a399bc63;
      expv[59] = 54'h0791a186d9dfdb;
      expv[60] = 54'h3e0d915458b7ad;
      expv[61] = 54'h3f6dae8467f365;
      expv[62] = 54'h043c90ab595a1d;
      expv[63] = 54'h0017d0f051c441;
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
