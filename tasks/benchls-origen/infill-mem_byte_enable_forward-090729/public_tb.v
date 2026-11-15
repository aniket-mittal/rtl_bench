// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 162;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_090729 dut (
    .ForwardRTM(in_vec[161:160]),
    .instr(in_vec[159:128]),
    .ALUout_M(in_vec[127:96]),
    .result_W(in_vec[95:64]),
    .result_WD(in_vec[63:32]),
    .WriteData_M(in_vec[31:0]),
    .BE(out_vec[35:32]),
    .WD(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 162'h39d360e7ce61f48c3b48fac5d38d94bcf0e61760a;
    stim[1] = 162'h3876b1785a09ae5f3912abbf706f8b53a26bf2932;
    stim[2] = 162'h38406f727093c506458a307e04ae73a3ef2d7cb00;
    stim[3] = 162'h187358b1f77421e2dd4c493d31316f9dfbba5a5bd;
    stim[4] = 162'h00dc6a3d0e0e281eecfae2838e5d5127e86334730;
    stim[5] = 162'h1c2ac0a3a565c9a34dfde1ce3628394e36cd56e7f;
    stim[6] = 162'h370201cf2fa946cec1e8382b91e8122e649515689;
    stim[7] = 162'h2c9a5e82e04b8edfd530c430ea29c61177395f989;
    stim[8] = 162'h0f8fca9d396360837efb15dd59abbcb526784d155;
    stim[9] = 162'h375e3a3be4dc873efbc911d9971369a97e9d6a963;
    stim[10] = 162'h2d725e93a309e27e49aa5d710f4fcc6573d4497d4;
    stim[11] = 162'h39fbe27719b16a73393f95e183b69717f1844102c;
    stim[12] = 162'h2ffb3e6189140d9fdd7635482c82146386aa287b1;
    stim[13] = 162'h0b4124fe48a694ecf25a63f15c264f2a1938b0f2f;
    stim[14] = 162'h0934a900f96cf5682a81c4c2a1f2348c1ecf8a83e;
    stim[15] = 162'h2190d2d7a95a57e2fcf8a84927860da5864bb1010;
    stim[16] = 162'h1d44a4d9c1be7947f0765cb99536f20576067f23f;
    stim[17] = 162'h1f76702c7287e06af0a0134abb574ab5b304b3971;
    stim[18] = 162'h01906557463a36a22c3dce144bf0d2906a3027f32;
    stim[19] = 162'h18f49a666277f95a9826c98e46181375b005837bd;
    stim[20] = 162'h3f708e669128d31104b3748ba62afea782f086178;
    stim[21] = 162'h0542fa639268a2e6e0d7cf9273f4e6cd0cdc7095e;
    stim[22] = 162'h3d069d76d20eae55f486328e168085d3aad6ca9fb;
    stim[23] = 162'h3e946c8ad044e48ebdbf4bf267e4e667688014c67;
    stim[24] = 162'h301d967065f6ad5445404732a1153938cde391ed6;
    stim[25] = 162'h0a59d9b7d3b29d23731bf6646dc516894b0ef6b18;
    stim[26] = 162'h0c3473dd9e85ce1775553ced7590cbd4d6d35915e;
    stim[27] = 162'h311db6d598fa06c4d4a92384b761ad8286e153452;
    stim[28] = 162'h367201e9d9c04f4452c2bdfc6a75b45b369465e66;
    stim[29] = 162'h0dcb4cb3e8d43f59ad7c1daee56f0113946586935;
    stim[30] = 162'h2ddb5c147bfd6354a197b64faf4637b44e753c60f;
    stim[31] = 162'h0d311af890f9ff51679cb0548d9c580e94eaa67a2;
    stim[32] = 162'h1bbc96a71be5890d5d1635416ae66d778f73a295d;
    stim[33] = 162'h0cf096064695c3ae57b3d7775e7655944fcbaabe0;
    stim[34] = 162'h2dc7391f9691ec200d424f7b098f9c2d6f8db8c50;
    stim[35] = 162'h05f97f50cebd8fadc39cac02c12981a326e1eb1ee;
    stim[36] = 162'h2d49d7ba8582bbe3e92044445af4e011565ad22b9;
    stim[37] = 162'h17da9ca3608db5060df2a12fd6ab5f44eb1bbea39;
    stim[38] = 162'h30ac41eb867343ef086e7ab20749c6e0a23701eac;
    stim[39] = 162'h097c2a11aa77e526bab091550d31649240caaef00;
    stim[40] = 162'h1165809c7026df1d9fb89a0b428dbe24dd2a9a624;
    stim[41] = 162'h1fd36a0543da18c1840e1f1df909b50d1579d687c;
    stim[42] = 162'h39d86b37a5f52ca5412fd0f1bd72ee2d84af6a06d;
    stim[43] = 162'h0b3e9077e198b21e9363c49a582be5aee5cd0ddb6;
    stim[44] = 162'h19101fd3ca327925c740c0bca74575719dbf2f196;
    stim[45] = 162'h0c67d9dacd8b497d43ec87d48db7613a4f01672f0;
    stim[46] = 162'h2f7e9564178879f46646b61002bffce3495c172a7;
    stim[47] = 162'h22f5e1fec3b30d9b1f69280e8edd7009df5ac0aa9;
    stim[48] = 162'h1431363f2f33165b55d94a726e46e4cf85c643bed;
    stim[49] = 162'h38994bf6a77b1969f929290ee62d0fa1810eda533;
    stim[50] = 162'h3ee18287ddc38e3bd35448901b45eadacffcc3a39;
    stim[51] = 162'h2f6be2c91e86aab3031e9b0a6e4887a6cb910fc0f;
    stim[52] = 162'h155a8a5333ad1eada7e454ba06287d30cd593dfe8;
    stim[53] = 162'h07416f322eceddf03dcee348244f25105562f7978;
    stim[54] = 162'h3c3d8f698dbade3ffe6ca7876ec8c59826be92121;
    stim[55] = 162'h0e5f4d168197152405cb0a38467273a2c95e3303f;
    stim[56] = 162'h133093e9d37abb994108beb92190deaf250ac492a;
    stim[57] = 162'h3d5834110b87fd72db216f0cb04c2417feb67cfa2;
    stim[58] = 162'h3ffe16e89216118affa2249e06494dde78585de09;
    stim[59] = 162'h3ff7406dde2a4cb92715f074d9cb01dd99a6fb11d;
    stim[60] = 162'h05fbf812a9871df99a49be99ce12c513d45ee5a7e;
    stim[61] = 162'h1aecbfd684501f215e1cac88463cc87aa41d7aad5;
    stim[62] = 162'h07182f41458ffe666903e5a37380c1da1a4958427;
    stim[63] = 162'h0f65780062ef5b0fac885e2b194f3a6633f7f4b01;
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
      expv[0] = 36'h000000000;
      expv[1] = 36'hc00000000;
      expv[2] = 36'h300000000;
      expv[3] = 36'h3d4c493d3;
      expv[4] = 36'h086334730;
      expv[5] = 36'h0dfde1ce3;
      expv[6] = 36'h000000000;
      expv[7] = 36'h0a29c6117;
      expv[8] = 36'h06784d155;
      expv[9] = 36'h000000000;
      expv[10] = 36'h0f4fcc657;
      expv[11] = 36'h000000000;
      expv[12] = 36'h0c8214638;
      expv[13] = 36'h0938b0f2f;
      expv[14] = 36'h4ecf8a83e;
      expv[15] = 36'h07860da58;
      expv[16] = 36'h00765cb99;
      expv[17] = 36'h00a0134ab;
      expv[18] = 36'h0a3027f32;
      expv[19] = 36'hf826c98e4;
      expv[20] = 36'h000000000;
      expv[21] = 36'h0cdc7095e;
      expv[22] = 36'h000000000;
      expv[23] = 36'h000000000;
      expv[24] = 36'h000000000;
      expv[25] = 36'hcb0ef6b18;
      expv[26] = 36'h06d35915e;
      expv[27] = 36'h000000000;
      expv[28] = 36'h000000000;
      expv[29] = 36'h046586935;
      expv[30] = 36'h0f4637b44;
      expv[31] = 36'h04eaa67a2;
      expv[32] = 36'h0d1635416;
      expv[33] = 36'h0fcbaabe0;
      expv[34] = 36'h098f9c2d6;
      expv[35] = 36'h06e1eb1ee;
      expv[36] = 36'h0af4e0115;
      expv[37] = 36'h0df2a12fd;
      expv[38] = 36'h000000000;
      expv[39] = 36'hc0caaef00;
      expv[40] = 36'h0fb89a0b4;
      expv[41] = 36'h040e1f1df;
      expv[42] = 36'h000000000;
      expv[43] = 36'h05cd0ddb6;
      expv[44] = 36'h1740c0bca;
      expv[45] = 36'h0f01672f0;
      expv[46] = 36'h02bffce34;
      expv[47] = 36'h0edd7009d;
      expv[48] = 36'h05d94a726;
      expv[49] = 36'h000000000;
      expv[50] = 36'h000000000;
      expv[51] = 36'h0e4887a6c;
      expv[52] = 36'h07e454ba0;
      expv[53] = 36'h0562f7978;
      expv[54] = 36'h000000000;
      expv[55] = 36'h095e3303f;
      expv[56] = 36'h0108beb92;
      expv[57] = 36'h000000000;
      expv[58] = 36'h000000000;
      expv[59] = 36'h000000000;
      expv[60] = 36'h045ee5a7e;
      expv[61] = 36'hfe1cac884;
      expv[62] = 36'h0a4958427;
      expv[63] = 36'h03f7f4b01;
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
