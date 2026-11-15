// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 199;
  localparam OW = 98;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00880 dut (
    .clock(clk),
    .reset(in_vec[198:198]),
    .IF_Flush(in_vec[197:197]),
    .IF_Stall(in_vec[196:196]),
    .ID_Stall(in_vec[195:195]),
    .IF_Instruction(in_vec[194:163]),
    .IF_PCAdd4(in_vec[162:131]),
    .IF_PC(in_vec[130:99]),
    .IF_IsBDS(in_vec[98:98]),
    .ID_Instruction(in_vec[97:66]),
    .ID_PCAdd4(in_vec[65:34]),
    .ID_RestartPC(in_vec[33:2]),
    .ID_IsBDS(in_vec[1:1]),
    .ID_IsFlushed(in_vec[0:0]),
    .vote_ID_Instruction(out_vec[97:66]),
    .vote_ID_PCAdd4(out_vec[65:34]),
    .vote_ID_RestartPC(out_vec[33:2]),
    .vote_ID_IsBDS(out_vec[1:1]),
    .vote_ID_IsFlushed(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 199'h57f10f1315a894e407b91d20ac5ef5d93ce5060a44c7ae9684;
    stim[1] = 199'h76eab4cd85afab53675ce6b595750b265c32280c120eea344a;
    stim[2] = 199'h2210f33292474ab225fac255cc37cccfda9ea682d8888aaf97;
    stim[3] = 199'h152ff6f5f42f250f12245af928ad616222a4d48bc9c04ec576;
    stim[4] = 199'h0bf871359a75838c41f544520033f75c697df3ecf57e7e3b15;
    stim[5] = 199'h2209594f9ba6e46056e28ccff08e9d1d2e47f26945d964ff0a;
    stim[6] = 199'h20548e4e0aba9f75c0bbbbb0e2df207b6cecf1a06cea4088d0;
    stim[7] = 199'h05e6ea654cd201ec421e3d7c3be092cee3d187df4feb7ba28a;
    stim[8] = 199'h323196a3ee4ffe68325799e784d6caca98753f9fb41594ace7;
    stim[9] = 199'h2f6cca96dd1a013265740ede6c907c2c5d6affd6def7a7b20c;
    stim[10] = 199'h3d4c501e4570acf7a6ddc76c9842c656636e5aef84ed5d60a2;
    stim[11] = 199'h182dda3df05d05f6f0d7895a33f2e35ee2402e90486a1b8bf2;
    stim[12] = 199'h0d10c0bc5b533c5fbd1267cd329f577c5517fc575cf411e864;
    stim[13] = 199'h018342891d2de37250f3788244061ea51f1e901b9591580838;
    stim[14] = 199'h1aaf7457df1c8ec6550eea96fca86756089dd29d34a247bc0e;
    stim[15] = 199'h152eff30f64ec97c53269081151027e252ea0f56edf43c79c4;
    stim[16] = 199'h01f192dc021d3e0523f58e2a28c011be1651155d2200bf2564;
    stim[17] = 199'h09a8cde1e120987f3ee470ec3e8a8c2d69cd8387cc7ce37941;
    stim[18] = 199'h0a9e04f954c89c419259de21c536e6a22a30aee501890781f0;
    stim[19] = 199'h328f06adb1292f4060cfc392a0b036bba8b6f90b3ba852dfe5;
    stim[20] = 199'h5e4c934312ee01aa9b25a633b564d472a8f12d4645d19cb99b;
    stim[21] = 199'h105649eab061ef92fbc437a47a7af8215968f164d7ddce73a5;
    stim[22] = 199'h1d56aafc75736aae1e2ea35b9589a25aeff866124d08e84733;
    stim[23] = 199'h3d3e82a864572ad509e3d1d4e912569e73e49ca8e5c90440ce;
    stim[24] = 199'h1cdd76f37da5d39f6860be969421f5a460ad4e3fc40e99450c;
    stim[25] = 199'h25a1f7986a928f68371e1a119ed8585694197d50e1c4d75310;
    stim[26] = 199'h29701f561d2c1bf69c8fd812ccd39303bb21f34e82f08d540e;
    stim[27] = 199'h36004d1e44a8a0c10bf8e5b8183511802eb0fd3f4c430c62c1;
    stim[28] = 199'h281155ff02cb27326f6a1d7f15f4f18fc942086f664e86882e;
    stim[29] = 199'h1724a6c4b75eab28ded7fd7916b7b2d522914a403794581717;
    stim[30] = 199'h3c304d94fd9c6c5f1672c0e0ea9c0856fd28a29dbbc632ca1b;
    stim[31] = 199'h318caaa73d73d6a9e1d5de0c04766ff469ec41f032d330968d;
    stim[32] = 199'h116f3188db3024831352ab5e34cfb16814b51e63901f9779c7;
    stim[33] = 199'h65b91241742477e31e5c64b1ad89f69d881ccc80600f9ca56d;
    stim[34] = 199'h0d6bf359329e03ca32636c26fbba04dc8e35538a81692ee814;
    stim[35] = 199'h1844a1b2ae88cb3b4b2ef5047c46c306c02a6f7d8b0833dc8b;
    stim[36] = 199'h028adccb25ef002369bef2877326d5090c0c382d92bc8ff47a;
    stim[37] = 199'h053a3dced9cb89d7957095381e11553fca44260961f060a7e2;
    stim[38] = 199'h33c6e803f5747b4685f78cc637fe767f3edc92931074667307;
    stim[39] = 199'h0aee8f29caa222db5f47235ceb35092f11e47c4d6724301bf8;
    stim[40] = 199'h2ee009269abd862aec4c411a7459ab88283f29e7c85bf09cd7;
    stim[41] = 199'h1a7260135d00a5ff803c8b09a7fd7f4f72b004ea7cc52bb506;
    stim[42] = 199'h0e4b5d5c157288ebd8504f0a5deecd19875334336868e8df7a;
    stim[43] = 199'h04065b5be4013dd62252d8aaa07c85027f6f85cbfd70e544a8;
    stim[44] = 199'h27362e52c7e0b68babc2a6af964162a633f3589ca64f567243;
    stim[45] = 199'h1e61d174c2637886cbb7e240fc114006d7522ad4edfb317de0;
    stim[46] = 199'h0612042954a64c6b8efafbb5ee2b688deae80d142529a08b97;
    stim[47] = 199'h1876d28b03cbc7b72f9bf51e0edcb9a35d86c6cba087bcc19f;
    stim[48] = 199'h1da3173bb03b4ba403e32e14860359d5683699762556e781c6;
    stim[49] = 199'h30de289261b9a1c03d3d97a3a36fa99ec6c9ca7c16110990ad;
    stim[50] = 199'h1d610fde92b013d2f736521092af107eaa02da4ae4bc37008a;
    stim[51] = 199'h388043d97b75d984a6daa3885b6d5ceb0af20ebe468ad6fa3f;
    stim[52] = 199'h34c825a1880bf6b3265fd369e8de6bc7fddd50ad52f4e8767d;
    stim[53] = 199'h19b511b9767cae97ef204fa67b0bb02babbf6b5ee064e7f7db;
    stim[54] = 199'h3417fe3ab2edac852e25aa20d10089a4f339d05eb705c65344;
    stim[55] = 199'h239afb406f9b9f762b5352940975820de404154a4502d21098;
    stim[56] = 199'h241ad5ee6dd22fa8599be0383049a364f8c805e6e41e5d67d6;
    stim[57] = 199'h354a761dd47e7ec87b5fd7c44c55b41304d8ccc62448ac59c6;
    stim[58] = 199'h35f693f1d7e807dd3e9dcd35fc91bd1b9b132e08b794b81b67;
    stim[59] = 199'h1c9ce3571f5f82673a9b31c9e0ec1eb7b495810981bfee420a;
    stim[60] = 199'h3af070e354a83492865c8d372386c80d90bd85a63ca794b477;
    stim[61] = 199'h3726d0ae4afa901ec5200a8fb0edf6ceb7d83c4995fc2bad29;
    stim[62] = 199'h3f25d3c20e1b055eeb9a4f8365d1ed344cda5c5e0e78f3177b;
    stim[63] = 199'h04f1386b8bf88f42988da0659f3d23a015efa9665a5fe84498;
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
      expv[0] = 98'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 98'h0000000000000000000000000;
      expv[2] = 98'h0000000000000000000000000;
      expv[3] = 98'h00000000123a55910888aaf97;
      expv[4] = 98'h00000000217928789122d7c94;
      expv[5] = 98'h033f75c697df3ecf57e7e3b15;
      expv[6] = 98'h000000001d372302b714667f9;
      expv[7] = 98'h0000000015d4fbae05dddd871;
      expv[8] = 98'h2f37532a66900f6210f1ebe1c;
      expv[9] = 98'h00000000327ff34181594ace7;
      expv[10] = 98'h0907c2c5d6affd6def7a7b20c;
      expv[11] = 98'h042c656636e5aef84ed5d60a2;
      expv[12] = 98'h3f2e35ee2402e90486a1b8bf2;
      expv[13] = 98'h29f577c5517fc575cf411e864;
      expv[14] = 98'h0c1a1448e96f1b9299158083a;
      expv[15] = 98'h0a86756089dd29d34a247bc0e;
      expv[16] = 98'h0000000032764be29f43c79c6;
      expv[17] = 98'h0f8c96e010e9f0291fac71514;
      expv[18] = 98'h28a8c2d69cd8387cc7ce37941;
      expv[19] = 98'h136e6a22a30aee501890781f0;
      expv[20] = 98'h0000000009497a03067e1c951;
      expv[21] = 98'h0000000000000000000000000;
      expv[22] = 98'h00000000030f7c97de21bd23c;
      expv[23] = 98'h189a25aeff866124d08e84733;
      expv[24] = 98'h112569e73e49ca8e5c90440ce;
      expv[25] = 98'h021f5a460ad4e3fc40e99450c;
      expv[26] = 98'h0000000014947b419c4d75313;
      expv[27] = 98'h0d39303bb21f34e82f08d540e;
      expv[28] = 98'h00000000254506085fc72dc0d;
      expv[29] = 98'h1f4f18fc942086f664e86882e;
      expv[30] = 98'h000000003af55946f94581716;
      expv[31] = 98'h29c0856fd28a29dbbc632ca1b;
      expv[32] = 98'h000000002b9eb54f2d330968f;
      expv[33] = 98'h000000001981241881f9779c6;
      expv[34] = 98'h0000000000000000000000000;
      expv[35] = 98'h3ba04dc8e35538a81692ee814;
      expv[36] = 98'h046c306c02a6f7d8b0833dc8b;
      expv[37] = 98'h1456e6592f78011b4df7943b8;
      expv[38] = 98'h29d1ee76ce5c4ebc9f060a7e2;
      expv[39] = 98'h000000002ba3da34074667307;
      expv[40] = 98'h335092f11e47c4d6724301bf8;
      expv[41] = 98'h059ab88283f29e7c85bf09cd7;
      expv[42] = 98'h3fd7f4f72b004ea7cc52bb506;
      expv[43] = 98'h1eecd19875334336868e8df7a;
      expv[44] = 98'h2032dadf2009eeb11296c5550;
      expv[45] = 98'h000000003f05b45d64f567243;
      expv[46] = 98'h0114006d7522ad4edfb317de0;
      expv[47] = 98'h3090214aa532635c529a08b96;
      expv[48] = 98'h2dcb9a35d86c6cba087bcc19f;
      expv[49] = 98'h20359d5683699762556e781c6;
      expv[50] = 98'h000000000dcd0e01e9ecbd1d1;
      expv[51] = 98'h2af107eaa02da4ae4bc37008a;
      expv[52] = 98'h36d5ceb0af20ebe468ad6fa3f;
      expv[53] = 98'h00000000005fb59932fe9b4f5;
      expv[54] = 98'h30bb02babbf6b5ee064e7f7db;
      expv[55] = 98'h00000000176d6429712d51069;
      expv[56] = 98'h000000003cdcfbb15a9a94a05;
      expv[57] = 98'h000000002e917d42ccdf01c19;
      expv[58] = 98'h0000000023f3f643c48ac59c7;
      expv[59] = 98'h000000003f403ee9f94b81b67;
      expv[60] = 98'h0ec1eb7b495810981bfee420a;
      expv[61] = 98'h386c80d90bd85a63ca794b477;
      expv[62] = 98'h0000000017d480f62900547d9;
      expv[63] = 98'h1d1ed344cda5c5e0e78f3177b;
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
