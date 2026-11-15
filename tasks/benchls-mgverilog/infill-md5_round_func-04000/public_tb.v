// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 103;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04000 dut (
    .rx_round(in_vec[102:96]),
    .rx_x(in_vec[95:64]),
    .rx_y(in_vec[63:32]),
    .rx_z(in_vec[31:0]),
    .tx_f(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 103'h31090e0c0004d04d1ca91e44b2;
    stim[1] = 103'h01acd4376d96ba476b4a599487;
    stim[2] = 103'h3f83e40d2414272e432db263a5;
    stim[3] = 103'h34cfc1baef1ee5ebe70643ba69;
    stim[4] = 103'h55bdb6a18db25a7f1fbe41cc31;
    stim[5] = 103'h44ece6421f8c5fa34b96d092ad;
    stim[6] = 103'h7cfafde6657452cfb971dfcdc5;
    stim[7] = 103'h2da22d8bcacca7c8627bdfc212;
    stim[8] = 103'h2a45591fa284c195925f90ca28;
    stim[9] = 103'h28d2168a50fde2e0d2381c4451;
    stim[10] = 103'h6274bbea18174613824cedfa1e;
    stim[11] = 103'h7f6a199a53d9b373d64710c0dd;
    stim[12] = 103'h4ced5a06146b3acb81d9122b58;
    stim[13] = 103'h6050a16a57c49e9107919edd9b;
    stim[14] = 103'h766285a1359ad02dbd181e6d87;
    stim[15] = 103'h465410d3caa6bf824f82438ef5;
    stim[16] = 103'h329c631525ac22ac057e8f2fee;
    stim[17] = 103'h4db60555220af87a9997193466;
    stim[18] = 103'h0da47e2a2406c2142ba1a6852c;
    stim[19] = 103'h0d2fb5c668c81099027972dc7a;
    stim[20] = 103'h1b544242c1df7c5c1a33d50598;
    stim[21] = 103'h45db1c71d5b15a0e33ca6da4c3;
    stim[22] = 103'h4e9b16df27b13f9ed0cc046a84;
    stim[23] = 103'h0201db48bd705d6b381c41d5f4;
    stim[24] = 103'h41a6d043dcabee9ce6987a1f56;
    stim[25] = 103'h1dd03982b5a88c84b370ea6cbc;
    stim[26] = 103'h6c5fc169a4cdf20d3b0f2669bc;
    stim[27] = 103'h22b24d03d7e88e116854a31304;
    stim[28] = 103'h3cb8f31b26efa2b741b5946682;
    stim[29] = 103'h76f2e23317841f325941737c4c;
    stim[30] = 103'h6e9db99e910b5868f7b3f077d3;
    stim[31] = 103'h646ea36353d635760d2c084976;
    stim[32] = 103'h09a421ac815fd2f49a202b4519;
    stim[33] = 103'h080d31e007820f7aee7d4fc29a;
    stim[34] = 103'h64491b54e1eba25ec171e90ff7;
    stim[35] = 103'h331805548434f53faa1226a1b4;
    stim[36] = 103'h4996be7eb10db2b4e97f31323f;
    stim[37] = 103'h2505cd7d4a6e7573fb09e73e40;
    stim[38] = 103'h4a3046edb1392b8d213883aee8;
    stim[39] = 103'h61fddfd1d8f797035d5a3369fb;
    stim[40] = 103'h42934abd9af2321ae56bb46964;
    stim[41] = 103'h7f1f56452be61ed672a7fb3375;
    stim[42] = 103'h194bf673853e520a3750dabb3e;
    stim[43] = 103'h7986142bbef4de57a100ea0577;
    stim[44] = 103'h445c0ef65fbf899254f73d84ff;
    stim[45] = 103'h64856e791426636155b2e9b90d;
    stim[46] = 103'h5da85197ce631a8afd31aef8d6;
    stim[47] = 103'h1613be299cdb346acdb83bfa5d;
    stim[48] = 103'h533b1bb4cf063dca03471f84a2;
    stim[49] = 103'h20edc59df23ff20b2ff4a3d005;
    stim[50] = 103'h72dbabb1f52ef0938451ec7e41;
    stim[51] = 103'h11774d8eabf9b28afdb48a2dc4;
    stim[52] = 103'h050c3499b1f6faf0a9582fa79a;
    stim[53] = 103'h172276787949b043a3b01843b0;
    stim[54] = 103'h09fd4b7c40a40819068761b2ef;
    stim[55] = 103'h64d0e2ad1f4d7006225019e92c;
    stim[56] = 103'h2414c3d2cce4e87d047cd1ea16;
    stim[57] = 103'h01329637693f1befe2b27d8665;
    stim[58] = 103'h63669fc1a9a6ce4f6c2f18e3b5;
    stim[59] = 103'h5844fa8c5a2f5c2eb480568835;
    stim[60] = 103'h63622346c10f8443a45426e354;
    stim[61] = 103'h145742faf29708fcdd89b1bcfc;
    stim[62] = 103'h2980df9f30a3149b64f3284270;
    stim[63] = 103'h7eb8c647a5c1f092ff7121f5af;
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
      expv[0] = 32'h0dce0d0c;
      expv[1] = 32'h7037e481;
      expv[2] = 32'h11a50d66;
      expv[3] = 32'h1ee5fbef;
      expv[4] = 32'h4e48de52;
      expv[5] = 32'h0199ad44;
      expv[6] = 32'h048f19de;
      expv[7] = 32'hc8a27dcd;
      expv[8] = 32'h20efb5c7;
      expv[9] = 32'hea03db2c;
      expv[10] = 32'hc3edfdfb;
      expv[11] = 32'h93e6e5a5;
      expv[12] = 32'h82a5d9b3;
      expv[13] = 32'hbe5ed930;
      expv[14] = 32'h9d741ec8;
      expv[15] = 32'habaf2085;
      expv[16] = 32'h9c238525;
      expv[17] = 32'hdcfbaebb;
      expv[18] = 32'h031abb23;
      expv[19] = 32'h9ed78310;
      expv[20] = 32'h77d54518;
      expv[21] = 32'h6ec62eea;
      expv[22] = 32'h28e940dc;
      expv[23] = 32'h6dc7f671;
      expv[24] = 32'h493fbf33;
      expv[25] = 32'ha0caecb9;
      expv[26] = 32'ha23af6df;
      expv[27] = 32'he3defcd3;
      expv[28] = 32'hfab29343;
      expv[29] = 32'h4c7d80ec;
      expv[30] = 32'hd2e6766e;
      expv[31] = 32'hb95495de;
      expv[32] = 32'hdbd81d02;
      expv[33] = 32'hf2715873;
      expv[34] = 32'ha6adaa28;
      expv[35] = 32'h34d51e8e;
      expv[36] = 32'h1b408358;
      expv[37] = 32'h9c28c30e;
      expv[38] = 32'hcf393086;
      expv[39] = 32'h0a004685;
      expv[40] = 32'h65312365;
      expv[41] = 32'he1489bd1;
      expv[42] = 32'h1a5a8a3f;
      expv[43] = 32'h79cbd417;
      expv[44] = 32'he3c50d0b;
      expv[45] = 32'hea191ee3;
      expv[46] = 32'h470a1833;
      expv[47] = 32'hbb35facd;
      expv[48] = 32'h85e64f90;
      expv[49] = 32'h196e2df7;
      expv[50] = 32'h7558224b;
      expv[51] = 32'hf182abed;
      expv[52] = 32'ha2e1ce82;
      expv[53] = 32'h903843a1;
      expv[54] = 32'hde22d7a9;
      expv[55] = 32'h3f14bbec;
      expv[56] = 32'h630638e9;
      expv[57] = 32'hbff05eee;
      expv[58] = 32'h90709ec7;
      expv[59] = 32'h3b07f3a4;
      expv[60] = 32'hcdfe196e;
      expv[61] = 32'h9fb1fcdc;
      expv[62] = 32'h2fd7bdcb;
      expv[63] = 32'h7738dd5a;
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
