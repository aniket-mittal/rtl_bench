// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_127908 dut (
    .a(in_vec[128:65]),
    .b(in_vec[64:1]),
    .cin(in_vec[0:0]),
    .sum(out_vec[64:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h1da4c3041c5592f05f72562142a036be0;
    stim[1] = 129'h1048ee6315e1819722c29d084328cc0d4;
    stim[2] = 129'h1b55233a4790808fee53502b157830297;
    stim[3] = 129'h1fa03602e43963d96eb404d617c5c8bfd;
    stim[4] = 129'h0b66ca8c4d6b05ff2fb3c53e9b62a0d80;
    stim[5] = 129'h16ee0287aa811205ca56722be270ea42c;
    stim[6] = 129'h1aee28427427e3f79130eb3dadb5ca4d9;
    stim[7] = 129'h1480511251f466057143ff2497d56b57d;
    stim[8] = 129'h115e68ec0d83c4a5d097fc9ebddd78c93;
    stim[9] = 129'h1d404d70dfc7c4d98960f67f063c960f7;
    stim[10] = 129'h1a00cb859bc2a1bf4a0f136b8b89b3b8b;
    stim[11] = 129'h098e1f1854b3c025d9f907e65deeef732;
    stim[12] = 129'h07b111299c408f57efc386afac6475bc3;
    stim[13] = 129'h1e4e35a63408f2641363d56cae010d005;
    stim[14] = 129'h024891d80ef8d06f99c2ec6543b9eb557;
    stim[15] = 129'h12e312138c3ce3f4f4052ee8b14292b52;
    stim[16] = 129'h07a6d6e0cdcc0015765560010d02f28c4;
    stim[17] = 129'h1c21981a75a71d46978a9f6df0438680b;
    stim[18] = 129'h154dcaa58f69fed0ae4b41457ba4e1c33;
    stim[19] = 129'h07ce66aa8e122573293c906343921034f;
    stim[20] = 129'h0d09efffcb80072bf7baad06b4b7c8d54;
    stim[21] = 129'h1c4b0e8e4780a65c5811b2026af18423e;
    stim[22] = 129'h0738181584c0a05909086de461f3e8eaf;
    stim[23] = 129'h08ace6d21b07343124aababb06e2f7acd;
    stim[24] = 129'h0b7bda30c848ad09c8338f9e99b3ba1ba;
    stim[25] = 129'h199bf1ef54f3e1ef015e29bd1cabd772f;
    stim[26] = 129'h03e615023dda90c7b700f9478638a57c8;
    stim[27] = 129'h1ba2c54c57112b9060722d1daa737d509;
    stim[28] = 129'h03aeeaa66b08aeaf6194fe0b3f3ced82e;
    stim[29] = 129'h167ed814977ea999bee802910ed7e46ce;
    stim[30] = 129'h0bfbb0cdd1466c6c670da8be19a57c66b;
    stim[31] = 129'h0a0b430878798079e22917dd76b610c9d;
    stim[32] = 129'h0987e803aa9e6ba652eb8aa97b83bb611;
    stim[33] = 129'h12bbbed4e2adeb137eb3f2358bc78e86a;
    stim[34] = 129'h1f93626d22a30ced3f9307f810aed9438;
    stim[35] = 129'h140aad7d27ce4ae7b5083f941a14e904e;
    stim[36] = 129'h04458f0277f182736bc7b84f5d8186117;
    stim[37] = 129'h0b86af0ce3e7c5c2cca546c06455d306f;
    stim[38] = 129'h00f4cf12030a52fff0c4d150b7820fa0b;
    stim[39] = 129'h07ad2f3075f81427d7f91b3c002b04eed;
    stim[40] = 129'h0f4d262bfb715b5a89fa2e48e25fe2232;
    stim[41] = 129'h04344bfff0c2b9d57233b08dd3632b63e;
    stim[42] = 129'h10f8ac7661c468ba54732532b469ecf6d;
    stim[43] = 129'h1a8c5e189ebd679d80f11de8cf249cf9f;
    stim[44] = 129'h1a8d61c6f34f3c0ec79bd48dd3385678b;
    stim[45] = 129'h00092f0733c981404cfe3ee8332917cae;
    stim[46] = 129'h1319e9a0798f9940b5b1ea5552a49eb45;
    stim[47] = 129'h01985bd54ca54e86063ebcd5fd53b93ea;
    stim[48] = 129'h0f3953eab1dcdc8502105ff766ba9ef9c;
    stim[49] = 129'h168c270241de699add54044b562b1d767;
    stim[50] = 129'h020ca26b9e535c9ebc8257388ae35d64e;
    stim[51] = 129'h05a8fa76dfed14374d198a6106d5f472f;
    stim[52] = 129'h0e202165a9bb649f0eb861f038bc7f6b6;
    stim[53] = 129'h0bbf24a9c63becb49bb98ca7e8b578624;
    stim[54] = 129'h10a21942bfa48cea2559fa8fdc9fa741a;
    stim[55] = 129'h0fa5b4f26836bfc7961478db34fcaa6f6;
    stim[56] = 129'h00ae7a98678f01e15491f842905126a00;
    stim[57] = 129'h16079938cafb9b41ba2d6bd4170e1466e;
    stim[58] = 129'h0ddf58466eff33345d31de6d2640748a5;
    stim[59] = 129'h06865197e79b7d35c34a57b76cd3f81a5;
    stim[60] = 129'h00835268ff313fbc8f2485a05eb8b3e89;
    stim[61] = 129'h13c6149a4917554a78618eb8bc9b455db;
    stim[62] = 129'h0dd28e67cf8f75b18f83899247ccb3ed0;
    stim[63] = 129'h0faf28035e71f40d614ed0806364ea45f;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 65'h1d1719255ef5c9ae5;
      expv[1] = 65'h130b8b6b590a4da46;
      expv[2] = 65'h09a873655d08b0b97;
      expv[3] = 65'h0e543ad8fbff2c995;
      expv[4] = 65'h1b1a8fcae8cda6d72;
      expv[5] = 65'h014474b38cf1fc489;
      expv[6] = 65'h0c1f138021ddae453;
      expv[7] = 65'h05c45036e9c9d15d5;
      expv[8] = 65'h01f6658acb613d6f1;
      expv[9] = 65'h06a143efe6045ae91;
      expv[10] = 65'h040fdef1274c55781;
      expv[11] = 65'h038726feb2a2af98f;
      expv[12] = 65'h177497d948a505142;
      expv[13] = 65'h11b20b12e209ff647;
      expv[14] = 65'h1c0b7e3d52b2bbc50;
      expv[15] = 65'h06e840fc3d7f76aa1;
      expv[16] = 65'h1dfc36e1dacef2a1a;
      expv[17] = 65'h13ac378865eaa3c75;
      expv[18] = 65'h03990beb0b0ee093f;
      expv[19] = 65'h110af70dd1a435a82;
      expv[20] = 65'h04c49d068037d0013;
      expv[21] = 65'h145cc090b2722a803;
      expv[22] = 65'h104085f9e6b489440;
      expv[23] = 65'h0d57a18d21ea2bde0;
      expv[24] = 65'h13af69cf61fc67256;
      expv[25] = 65'h1afa1bac719fb9620;
      expv[26] = 65'h1ae70e49c41336442;
      expv[27] = 65'h1c14f26a0184a8e10;
      expv[28] = 65'h0543e8b1aa459c324;
      expv[29] = 65'h1566daa5a6568e069;
      expv[30] = 65'h1309598beaebe8d32;
      expv[31] = 65'h0c345ae5ef2f9143c;
      expv[32] = 65'h1c7372ad262227076;
      expv[33] = 65'h116fb10a6e75799a1;
      expv[34] = 65'h1f266a653351e630b;
      expv[35] = 65'h0912ed1141e333ec9;
      expv[36] = 65'h100d4751d5730884e;
      expv[37] = 65'h182bf5cd483d98c9c;
      expv[38] = 65'h11b9a062ba8c62a0a;
      expv[39] = 65'h1fa64a6c76231916a;
      expv[40] = 65'h19475474ddd13d7da;
      expv[41] = 65'h1667fc8dc425e5394;
      expv[42] = 65'h056bd1a9162e55b13;
      expv[43] = 65'h1b7d7c016de204978;
      expv[44] = 65'h02293654c68792879;
      expv[45] = 65'h0d076def66f2990b2;
      expv[46] = 65'h08cbd3f5cc3437f51;
      expv[47] = 65'h07d718ab49f907c4a;
      expv[48] = 65'h1149b3e218977b7ec;
      expv[49] = 65'h13e02b4d980987115;
      expv[50] = 65'h1e8ef9a42936ba038;
      expv[51] = 65'h12c284d7e6c308aa4;
      expv[52] = 65'h1cd88355e277e40a6;
      expv[53] = 65'h0778b151aef16516d;
      expv[54] = 65'h15fc13d29c44342bc;
      expv[55] = 65'h05ba2dcd9d336a36f;
      expv[56] = 65'h154072daf7e028814;
      expv[57] = 65'h1035050ce209afa89;
      expv[58] = 65'h0b1136b3953fa7beb;
      expv[59] = 65'h09d0a94f546f75502;
      expv[60] = 65'h0fa7d8095de9f3a52;
      expv[61] = 65'h0c27a35305b29aa83;
      expv[62] = 65'h1d5617fa175c299e8;
      expv[63] = 65'h10fdf883c1d6de536;
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
