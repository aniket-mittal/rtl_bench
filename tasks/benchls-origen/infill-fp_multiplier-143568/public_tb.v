// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_143568 dut (
    .clk(clk),
    .rstn(in_vec[64:64]),
    .afl(in_vec[63:32]),
    .bfl(in_vec[31:0]),
    .fl(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h044e4700a04880f30;
    stim[1] = 65'h0bc3897cb82fd662c;
    stim[2] = 65'h12ee69a50a70449c0;
    stim[3] = 65'h1ae6ae57f6cee4414;
    stim[4] = 65'h1864a17d8ef8774b1;
    stim[5] = 65'h1fe68cf01fe705edd;
    stim[6] = 65'h1c8a3d13a4c9c988b;
    stim[7] = 65'h1dbc1fc43124ffb5d;
    stim[8] = 65'h109ae6638ebdd7b5b;
    stim[9] = 65'h103cd13540011aecc;
    stim[10] = 65'h14cd1b75e677dbedf;
    stim[11] = 65'h0a167aa31cf5d86c9;
    stim[12] = 65'h1b710914b18b30df3;
    stim[13] = 65'h1bfb4e37568a5a635;
    stim[14] = 65'h1296fc98dcef16ae6;
    stim[15] = 65'h1cd644797c5c09806;
    stim[16] = 65'h1005c3d289d2dd6af;
    stim[17] = 65'h00f3a3aab26880953;
    stim[18] = 65'h110df91d4eb56ee08;
    stim[19] = 65'h1cdb618d0600517ac;
    stim[20] = 65'h08e7abb7814a7a532;
    stim[21] = 65'h12457cc8d51a66f85;
    stim[22] = 65'h13a5264b905230ba3;
    stim[23] = 65'h1ccf3aa7b9c49c6a7;
    stim[24] = 65'h1baa198da86be2b2f;
    stim[25] = 65'h17045c4f247b6552f;
    stim[26] = 65'h128ebe9a71814f8f7;
    stim[27] = 65'h1adcd3b2a6c4645f3;
    stim[28] = 65'h172f2222ae0e3ddc7;
    stim[29] = 65'h1f22fc85696f4351d;
    stim[30] = 65'h1cacfaa87c436c870;
    stim[31] = 65'h11a06fe8b0eb32bda;
    stim[32] = 65'h153ee259e717892bf;
    stim[33] = 65'h10f4eaf6d3818e625;
    stim[34] = 65'h1327fb12c42b3e50f;
    stim[35] = 65'h1b4b0ee8e338b9350;
    stim[36] = 65'h1eb8de639278212b0;
    stim[37] = 65'h165d00cd0d4e2961f;
    stim[38] = 65'h13ff64c86fc14143d;
    stim[39] = 65'h1945eae0119930067;
    stim[40] = 65'h116de05cd5c1dbb5b;
    stim[41] = 65'h1e2ffe1f3b3ddeaef;
    stim[42] = 65'h11d6ab285830ffc6d;
    stim[43] = 65'h18a757e44af7806c2;
    stim[44] = 65'h179be4b41a32081ae;
    stim[45] = 65'h14f37e17495be2a1c;
    stim[46] = 65'h1799a6bcb63733224;
    stim[47] = 65'h1de846da43c496b67;
    stim[48] = 65'h1d90ddbe3d2874b3d;
    stim[49] = 65'h1da5d6008a7dd94d5;
    stim[50] = 65'h132a520fe13dfe77d;
    stim[51] = 65'h1d1386b4bcc4da157;
    stim[52] = 65'h1d5e47d5b00e48c2f;
    stim[53] = 65'h1ce3ca56f010f6eef;
    stim[54] = 65'h11918de9f2976727e;
    stim[55] = 65'h1314e4bad90bf62eb;
    stim[56] = 65'h191d7a11eb3ea5ac3;
    stim[57] = 65'h14565e6e0ab8e836b;
    stim[58] = 65'h187df853b56d75c2e;
    stim[59] = 65'h1d6314ee1bdae8b57;
    stim[60] = 65'h1c2277633405add5d;
    stim[61] = 65'h12cec9773603cd421;
    stim[62] = 65'h196d091dd07a019ea;
    stim[63] = 65'h128d1c2d70c85e98b;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00800000;
      expv[4] = 32'h00800000;
      expv[5] = 32'h976e5400;
      expv[6] = 32'hdcb53fa6;
      expv[7] = 32'h376aeeb1;
      expv[8] = 32'h3e3530ab;
      expv[9] = 32'hd6e4351c;
      expv[10] = 32'hafbb32e5;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00800000;
      expv[14] = 32'h00800000;
      expv[15] = 32'h914a3af0;
      expv[16] = 32'he9ea1816;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00800000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00800000;
      expv[23] = 32'h00800000;
      expv[24] = 32'h3798994a;
      expv[25] = 32'h0105ffb2;
      expv[26] = 32'h2ac00def;
      expv[27] = 32'h02f80ab4;
      expv[28] = 32'h7999b7a5;
      expv[29] = 32'h02894882;
      expv[30] = 32'hdb9ef3d6;
      expv[31] = 32'h9557860e;
      expv[32] = 32'h4aa7af6a;
      expv[33] = 32'h509445d4;
      expv[34] = 32'h6a5e7b1a;
      expv[35] = 32'h06ce79e8;
      expv[36] = 32'h08fb71f8;
      expv[37] = 32'h36e75b54;
      expv[38] = 32'ha9e07757;
      expv[39] = 32'hd4903289;
      expv[40] = 32'hfc704aa0;
      expv[41] = 32'hfd8e77b6;
      expv[42] = 32'hef7fde44;
      expv[43] = 32'h34919817;
      expv[44] = 32'h585dd0e2;
      expv[45] = 32'he2040123;
      expv[46] = 32'h7b6dd8cc;
      expv[47] = 32'hde774f6d;
      expv[48] = 32'ha6912f26;
      expv[49] = 32'h1e92b290;
      expv[50] = 32'hdc6831a4;
      expv[51] = 32'h6d15f14b;
      expv[52] = 32'h43ff3935;
      expv[53] = 32'h08106d0e;
      expv[54] = 32'h5f142225;
      expv[55] = 32'h984bfcc3;
      expv[56] = 32'h90e9b228;
      expv[57] = 32'h04265496;
      expv[58] = 32'h839a3a2c;
      expv[59] = 32'h074565b8;
      expv[60] = 32'hb27ffc15;
      expv[61] = 32'ha07812c1;
      expv[62] = 32'h5578e41f;
      expv[63] = 32'hc41e56ea;
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
