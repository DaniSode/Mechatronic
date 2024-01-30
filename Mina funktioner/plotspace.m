function plotspace(DHw ,DH, DHcm, scale, s)
    
    figure
    hold on;
    axis equal;
    grid on
    title('3d representation of the all the cordinate frames')
    xlabel('x');
    ylabel('y');
    zlabel('z');
    view(-30,30);
    
    
    base = eye(4);
    origin = base(1:3, 4);
    x = base(1:3, 1);
    y = base(1:3, 2);
    z = base(1:3, 3);
    hold on
    quiver3(origin(1), origin(2), origin(3), x(1), x(2), x(3), scale,'r','lineWidth',2,'MaxHeadSize',2);
    quiver3(origin(1), origin(2), origin(3), y(1), y(2), y(3), scale,'g','lineWidth',2,'MaxHeadSize',2);
    quiver3(origin(1), origin(2), origin(3), z(1), z(2), z(3), scale,'b','lineWidth',2,'MaxHeadSize',2);
    plot3(0, 0, 0, 'k.', 'MarkerSize', 20);
    
    if isempty(DHw) || all(DHw(1,:) == 0)
        if s == 'a'
            text(x(1)*scale, x(2)*scale, x(3)*scale,'  x_0')
            text(y(1)*scale, y(2)*scale, y(3)*scale,'  y_0')
            text(z(1)*scale, z(2)*scale, z(3)*scale,'  z_0')
        else
            text(origin(1), origin(2), origin(3),'  cf_0 = w')
        end
    else
        if s == 'a'
            text(x(1)*scale, x(2)*scale, x(3)*scale,'  x_0')
            text(y(1)*scale, y(2)*scale, y(3)*scale,'  y_0')
            text(z(1)*scale, z(2)*scale, z(3)*scale,'  z_0')
        else
            text(origin(1), origin(2), origin(3),'  cf_0')
        end

        originold = zeros(3,1);
        for i = 1:size(DHw,1)
            HT = DHtoHT_Distal(DHw,0,i);
            origin = HT(1:3, 4);
            x = HT(1:3, 1);
            y = HT(1:3, 2);
            z = HT(1:3, 3);
            hold on
            quiver3(origin(1), origin(2), origin(3), x(1), x(2), x(3), scale,'r','lineWidth',2,'MaxHeadSize',2);
            quiver3(origin(1), origin(2), origin(3), y(1), y(2), y(3), scale,'g','lineWidth',2,'MaxHeadSize',2);
            quiver3(origin(1), origin(2), origin(3), z(1), z(2), z(3), scale,'b','lineWidth',2,'MaxHeadSize',2);
            plot3([origin(1) originold(1)],[origin(2) originold(2)],[origin(3) originold(3)],'.-.','color',[0.44 0.44 0.44],'lineWidth',0.5)
            plot3(origin(1), origin(2), origin(3), 'k.', 'MarkerSize', 10);
            if i == size(DHw,1)

                if s == 'a'
                    text(origin(1) + x(1)*scale, origin(2) + x(2)*scale, origin(3) + x(3)*scale, ' x_w')
                    text(origin(1) + y(1)*scale, origin(2) + y(2)*scale, origin(3) + y(3)*scale, ' y_w')
                    text(origin(1) + z(1)*scale, origin(2) + z(2)*scale, origin(3) + z(3)*scale,' z_w')
                else
                    text(origin(1), origin(2), origin(3),'  cf_w')
                end
            else

                if s == 'a'
                    text(origin(1) + x(1)*scale, origin(2) + x(2)*scale, origin(3) + x(3)*scale, sprintf(' x_{w%g}',size(DHw,1)+1-i))
                    text(origin(1) + y(1)*scale, origin(2) + y(2)*scale, origin(3) + y(3)*scale, sprintf(' y_{w%g}',size(DHw,1)+1-i))
                    text(origin(1) + z(1)*scale, origin(2) + z(2)*scale, origin(3) + z(3)*scale, sprintf(' z_{w%g}',size(DHw,1)+1-i))
                else
                    text(origin(1), origin(2), origin(3), sprintf(' cf_{w%g}',size(DHw,1)+1-i))
                end

            end
            originold = origin;
        end

    end


    if isempty(DHcm) == 0
        for i = 1:size(DHcm,1)
            HTcm = DHtoHTcm(DH,DHcm,0,i);
            origin = HTcm(1:3, 4);
            x = HTcm(1:3, 1);
            y = HTcm(1:3, 2);
            z = HTcm(1:3, 3);
            hold on
            quiver3(origin(1), origin(2), origin(3), x(1), x(2), x(3), scale,'r','lineWidth',2,'MaxHeadSize',2);
            quiver3(origin(1), origin(2), origin(3), y(1), y(2), y(3), scale,'g','lineWidth',2,'MaxHeadSize',2);
            quiver3(origin(1), origin(2), origin(3), z(1), z(2), z(3), scale,'b','lineWidth',2,'MaxHeadSize',2);
            plot3(origin(1), origin(2), origin(3), 'k.', 'MarkerSize', 10);
            if s == 'a'
                text(origin(1) + x(1)*scale, origin(2) + x(2)*scale, origin(3) + x(3)*scale, sprintf('  x_{cm%g}',i))
                text(origin(1) + y(1)*scale, origin(2) + y(2)*scale, origin(3) + y(3)*scale, sprintf('  y_{cm%g}',i))
                text(origin(1) + z(1)*scale, origin(2) + z(2)*scale, origin(3) + z(3)*scale, sprintf('  z_{cm%g}',i))
            else
                text(origin(1), origin(2), origin(3), sprintf('  cf cm_%g',i))
            end            
        end
    end

    originold = zeros(3,1);
    for i = 1:size(DH,1)
        HT = DHtoHT_Distal(DH,0,i);
        origin = HT(1:3, 4);
        x = HT(1:3, 1);
        y = HT(1:3, 2);
        z = HT(1:3, 3);
        hold on
        quiver3(origin(1), origin(2), origin(3), x(1), x(2), x(3), scale,'r','lineWidth',2,'MaxHeadSize',2);
        quiver3(origin(1), origin(2), origin(3), y(1), y(2), y(3), scale,'g','lineWidth',2,'MaxHeadSize',2);
        quiver3(origin(1), origin(2), origin(3), z(1), z(2), z(3), scale,'b','lineWidth',2,'MaxHeadSize',2);
        plot3([origin(1) originold(1)],[origin(2) originold(2)],[origin(3) originold(3)],'color',[0.44 0.44 0.44],'lineWidth',0.5)
        plot3(origin(1), origin(2), origin(3), 'k.', 'MarkerSize', 10);
        originold = origin;
        if i ~= size(DH,1)
            if s == 'a'
                text(origin(1) + x(1)*scale, origin(2) + x(2)*scale, origin(3) + x(3)*scale, sprintf(' x_%g',i))
                text(origin(1) + y(1)*scale, origin(2) + y(2)*scale, origin(3) + y(3)*scale, sprintf(' y_%g',i))
                text(origin(1) + z(1)*scale, origin(2) + z(2)*scale, origin(3) + z(3)*scale, sprintf(' z_%g',i))
            else
                text(origin(1), origin(2), origin(3), sprintf('  cf_%g',i))
            end    
        else
            if s == 'a'
                text(origin(1) + x(1)*scale, origin(2) + x(2)*scale, origin(3) + x(3)*scale, ' x_{ef}')
                text(origin(1) + y(1)*scale, origin(2) + y(2)*scale, origin(3) + y(3)*scale, ' y_{ef}')
                text(origin(1) + z(1)*scale, origin(2) + z(2)*scale, origin(3) + z(3)*scale,' z_{ef}')
            else
                text(origin(1), origin(2), origin(3), '  cf_{ef}')
            end    
        end
    end

end     